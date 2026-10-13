# frozen_string_literal: true

#
# ENV stubbing is opt-in, via a shared context, rather than global
#
# Usage:
#
# describe 'my stubbed test' do
#   include_context 'with stubbed env'
#   before do
#     stub_env('FOO' => 'is bar')
#     # or, equivalently:
#     stub_env(FOO: 'is bar')
#     # or, equivalently:
#     stub_env('FOO', 'is bar')
#     # or, equivalently:
#     stub_env(FOO: 'is bar')
#   end
#   it 'does a thing' do
#     expect(ENV['FOO']).to eq('is bar')
#   end
# end
#
# NOTE: This file was originally written by Liam Bennet (https://github.com/ljkbennett)
#       as part of the stub_env library (https://github.com/ljkbennett/stub_env).
#       It has evolved since then.
module RSpec
  module StubbedEnv
    # Helpers to unobtrusively stub ENV
    module StubHelpers
      # Can be called with all key value pairs to be stubbed as a hash:
      #
      #     stub_env('A' => 'B', 'C' => 'D', 'E' => 'F') # Preferred
      #
      # Alternatively can be called one per ENV key-value pair to stub:
      #
      #     stub_env('A', 'B') # NOT
      #     stub_env('C', 'D') # AS
      #     stub_env('E', 'F') # GOOD (Creates redundant stubs on values_at)
      def stub_env(key_or_hash, value = nil)
        init_stub unless env_stubbed?
        if key_or_hash.is_a?(Hash)
          key_or_hash.each { |k, v| add_stubbed_value(k, v) }
        else
          add_stubbed_value(key_or_hash, value)
        end
      end

      # Opt in to stubbing ENV hash accessors. By default, stub_env only stubs
      # ENV[], ENV.fetch, and ENV.values_at so partial ENV stubs stay narrowly
      # scoped.
      def stub_env_hash_accessors
        init_stub unless env_stubbed?
        allow(ENV).to(receive(:to_hash) { mixed_env_hash })
        allow(ENV).to(receive(:to_h) { mixed_env_hash })
      end

      def env_stubbed?
        instance_variable_defined?(:@__rspec_stubbed_env_mutations) && !@__rspec_stubbed_env_mutations.empty?
      end

      def init_stub
        @__rspec_stubbed_env_mutations ||= []
        install_env_accessors
        add_stubbed_value(STUBBED_KEY, true, :track => false)
      end

      # Install ONE block-backed receive per accessor instead of per-key
      # `.with(key)` expectations. Per-key expectations collide when the same
      # key is stubbed again in a later example after the earlier expectation
      # has been invoked — rspec-mocks raises "message expectation ... has
      # already been invoked and cannot be modified further" (observed as a
      # seed-dependent CI failure). The blocks read the mutation ledger at
      # call time, so later stub_env / hide_env calls only append to it.
      def install_env_accessors
        allow(ENV).to(receive(:[]) { |key| mixed_env_hash[key] })
        allow(ENV).to(receive(:fetch) do |key, *rest, &default_block|
          hidden = @__rspec_stubbed_env_mutations.reverse.any? do |op, k, _|
            op == :hide && k == key
          end
          value = mixed_env_hash[key]
          if hidden && value.nil?
            unless rest.empty?
              next rest.first
            end
            next default_block.call if default_block

            raise KeyError, %(key not found: "#{key}")
          end
          if value.nil?
            next rest.first unless rest.empty?
            next default_block.call if default_block
          end

          value
        end)
        allow(ENV).to(receive(:values_at)) do |*args|
          args.map { |arg| mixed_env_hash[arg] }
        end
      end

      def remember_stubbed_value(key, value)
        @__rspec_stubbed_env_mutations ||= []
        @__rspec_stubbed_env_mutations << [:stub, key, value]
      end

      def remember_hidden_key(key)
        @__rspec_stubbed_env_mutations ||= []
        @__rspec_stubbed_env_mutations << [:hide, key]
      end

      def mixed_env_hash
        @__rspec_stubbed_env_mutations.each_with_object(ENV.each_pair.to_h) do |mutation, hash|
          operation, key, value = mutation
          case operation
          when :stub
            value.nil? ? hash.delete(key) : hash[key] = value
          when :hide
            hash.delete(key)
          end
        end
      end

      private

      STUBBED_KEY = "__STUBBED__"

      def add_stubbed_value(key, value, track: true)
        key = key.to_s # Support symbols by forcing to string
        remember_stubbed_value(key, value) if track
      end
    end
  end
end
