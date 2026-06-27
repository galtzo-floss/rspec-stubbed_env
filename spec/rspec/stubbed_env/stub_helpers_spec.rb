# frozen_string_literal: true

require "spec_helper"

RSpec.describe(RSpec::StubbedEnv::StubHelpers) do
  describe "stub_env" do
    context "when no stubbing" do
      subject(:myenv) { FooByEnv.new }

      it "is test env" do
        expect(myenv.env).to(eq("test"))
      end

      it "has 2 localhost settings" do
        expect(myenv.array.grep(/localhost:\d{3}\Z/).length).to(eq(2))
      end

      it "has size 2" do
        expect(myenv.size).to(eq(2))
      end
    end

    context "when hash signature with development environment" do
      subject(:myenv) { FooByEnv.new }

      include_context "with stubbed env"

      let(:environment) { "development" }

      before do
        stub_env(
          "MEDIUM_1" => "datastore-01.example.org",
          "MEDIUM_2" => "datastore-02.example.org",
          "IRRELEVANT_3" => "datastore-03.example.org",
        )
        allow(Rails).to(receive(:env).and_return(environment))
      end

      it "is development env" do
        expect(myenv.env).to(eq(environment))
      end

      it "has 2 example.org settings" do
        expect(myenv.array.grep(/datastore-\d{2}\.example\.org\Z/).length).to(eq(2))
      end

      it "has size 2" do
        expect(myenv.size).to(eq(2))
      end
    end

    context "when hash signature with production environment" do
      subject(:myenv) { FooByEnv.new }

      include_context "with stubbed env"

      let(:environment) { "production" }

      before do
        stub_env(
          "BIG_1" => "datastore-01.example.org",
          "BIG_2" => "datastore-02.example.org",
          "BIG_3" => "datastore-03.example.org",
          "BIG_4" => "datastore-04.example.org",
          "IRRELEVANT_5" => "datastore-03.example.org",
        )
        allow(Rails).to(receive(:env).and_return(environment))
      end

      it "is production env" do
        expect(myenv.env).to(eq(environment))
      end

      it "has 4 example.org settings" do
        expect(myenv.array.grep(/datastore-\d{2}\.example\.org\Z/).length).to(eq(4))
      end

      it "has size 4" do
        expect(myenv.size).to(eq(4))
      end
    end

    context "when key/value signature with development environment" do
      subject(:myenv) { FooByEnv.new }

      include_context "with stubbed env"

      let(:environment) { "development" }

      before do
        stub_env("MEDIUM_1", "datastore-01.example.org")
        stub_env("MEDIUM_2", "datastore-02.example.org")
        stub_env("IRRELEVANT_3", "datastore-03.example.org")
        allow(Rails).to(receive(:env).and_return(environment))
      end

      it "is development env" do
        expect(myenv.env).to(eq(environment))
      end

      it "has 2 example.org settings" do
        expect(myenv.array.grep(/datastore-\d{2}\.example\.org\Z/).length).to(eq(2))
      end

      it "has size 2" do
        expect(myenv.size).to(eq(2))
      end
    end

    context "when key/value signature with production environment" do
      subject(:myenv) { FooByEnv.new }

      include_context "with stubbed env"

      let(:environment) { "production" }

      before do
        stub_env("BIG_1", "datastore-01.example.org")
        stub_env("BIG_2", "datastore-02.example.org")
        stub_env("BIG_3", "datastore-03.example.org")
        stub_env("BIG_4", "datastore-04.example.org")
        stub_env("IRRELEVANT_5", "datastore-05.example.org")
        allow(Rails).to(receive(:env).and_return(environment))
      end

      it "is production env" do
        expect(myenv.env).to(eq(environment))
      end

      it "has 4 example.org settings" do
        expect(myenv.array.grep(/datastore-\d{2}\.example\.org\Z/).length).to(eq(4))
      end

      it "has size 4" do
        expect(myenv.size).to(eq(4))
      end
    end
  end

  describe "#values_at" do
    include_context "with stubbed env"

    before do
      ENV["TO_BE_STUBBED"] = "to_be_stubbed"
      ENV["NOT_STUBBED"] = "not_stubbed"
    end

    after do
      ENV.delete("TO_BE_STUBBED")
      ENV.delete("NOT_STUBBED")
    end

    context "when not stubbed" do
      it "returns original" do
        expect(ENV.values_at("TO_BE_STUBBED", "NOT_STUBBED")).to(contain_exactly("to_be_stubbed", "not_stubbed"))
      end
    end

    context "when stubbed" do
      it "returns stubbed values if stubbed" do
        stub_env("TO_BE_STUBBED", "horsehair")
        expect(ENV.values_at("TO_BE_STUBBED", "NOT_STUBBED")).to(contain_exactly("horsehair", "not_stubbed"))
      end
    end
  end

  describe "#stub_env_hash_accessors" do
    include_context "with stubbed env"
    include_context "with hidden env"

    before do
      ENV["TO_BE_STUBBED"] = "real_stubbed"
      ENV["TO_BE_HIDDEN"] = "real_hidden"
      ENV["NOT_STUBBED"] = "not_stubbed"
    end

    after do
      ENV.delete("TO_BE_STUBBED")
      ENV.delete("TO_BE_HIDDEN")
      ENV.delete("NOT_STUBBED")
      ENV.delete("to_hash")
    end

    it "does not stub to_hash by default" do
      stub_env("TO_BE_STUBBED", "stubbed")
      hide_env("TO_BE_HIDDEN")

      expect(ENV.to_hash).to(include("TO_BE_STUBBED" => "real_stubbed", "TO_BE_HIDDEN" => "real_hidden"))
    end

    it "does not stub to_h by default" do
      stub_env("TO_BE_STUBBED", "stubbed")
      hide_env("TO_BE_HIDDEN")

      expect(ENV.to_h).to(include("TO_BE_STUBBED" => "real_stubbed", "TO_BE_HIDDEN" => "real_hidden"))
    end

    it "returns mixed real and stubbed values when opted in" do
      stub_env_hash_accessors
      stub_env("TO_BE_STUBBED", "stubbed")
      hide_env("TO_BE_HIDDEN")

      expect(ENV.to_hash).to(include("TO_BE_STUBBED" => "stubbed", "NOT_STUBBED" => "not_stubbed"))
    end

    it "removes hidden values from opted-in hash accessors" do
      stub_env_hash_accessors
      hide_env("TO_BE_HIDDEN")

      expect(ENV.to_hash).not_to(have_key("TO_BE_HIDDEN"))
    end

    it "keeps to_h aligned with to_hash when opted in" do
      stub_env_hash_accessors
      stub_env("TO_BE_STUBBED", "stubbed")

      expect(ENV.to_h).to(eq(ENV.to_hash))
    end

    it "reflects a stub after a hide in hash accessors" do
      stub_env_hash_accessors
      hide_env("TO_BE_STUBBED")
      stub_env("TO_BE_STUBBED", "stubbed_after_hide")

      expect(ENV.to_hash).to(include("TO_BE_STUBBED" => "stubbed_after_hide"))
    end

    it "reflects a hide after a stub in hash accessors" do
      stub_env_hash_accessors
      stub_env("TO_BE_HIDDEN", "stubbed_before_hide")
      hide_env("TO_BE_HIDDEN")

      expect(ENV.to_hash).not_to(have_key("TO_BE_HIDDEN"))
    end

    it "still supports ENV[] for an environment key named to_hash" do
      stub_env_hash_accessors
      stub_env("to_hash", "env value")

      expect(ENV["to_hash"]).to(eq("env value"))
    end

    it "still supports ENV.to_hash with an environment key named to_hash" do
      stub_env_hash_accessors
      stub_env("to_hash", "env value")

      expect(ENV.to_hash).to(include("to_hash" => "env value"))
    end
  end

  describe "stubbing" do
    subject(:do_stub) { stub_env("STAR", "ships") }

    include_context "with stubbed env"

    it "does not raise error" do
      block_is_expected.to(not_raise_error)
    end

    it "stubs a key that wasn't previously set" do
      block_is_expected.to(change { ENV["STAR"] }.from(nil).to("ships"))
    end
  end

  describe "stubbing trough context arguments" do
    include_context "with stubbed env", "STAR" => "ships", "META" => true

    it "stubs all keys provided in the arguments" do
      {"STAR" => "ships", "META" => true}.each do |key, value|
        expect(ENV[key]).to(eq(value))
      end
    end
  end
end
