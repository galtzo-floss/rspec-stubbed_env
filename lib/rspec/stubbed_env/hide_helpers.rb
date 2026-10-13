# frozen_string_literal: true

require "rspec/stubbed_env/stub_helpers"

#
# ENV hiding is opt-in, via a shared context, rather than global
#
# Usage:
#
# describe 'my hidden ENV test' do
#   include_context 'with hidden env'
#   before do
#     ENV["FOO"] = "is bar"
#     hide_env('FOO')
#   end
#   it 'is nil' do
#     expect(ENV['FOO']).to be_nil
#   end
#   it 'raises KeyError on fetch' do
#     expect { ENV.fetch('FOO') }.to raise_error(KeyError)
#   end
# end

module RSpec
  module StubbedEnv
    # Helpers to unobtrusively stub ENV
    module HideHelpers
      include StubHelpers

      # Can be called with an array of ENV keys to hide:
      #
      #     hide_env('FOO', 'BAR', 'BAZ') # Preferred
      #
      # Alternatively can be called once per ENV key to hide:
      #
      #     stub_env('A') # NOT
      #     stub_env('C') # AS
      #     stub_env('E') # GOOD (creates redundant stubs on values_at)
      def hide_env(*keys)
        init_stub unless env_stubbed?
        keys.each do |key|
          add_hidden_key(key)
        end
      end

      private

      def add_hidden_key(key)
        key = key.to_s # Support symbols by forcing to string
        remember_hidden_key(key)
      end
    end
  end
end
