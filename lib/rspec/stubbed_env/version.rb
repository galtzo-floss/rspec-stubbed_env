# frozen_string_literal: true

module RSpec
  module StubbedEnv
    module Version
      VERSION = "1.0.6"
    end
    VERSION = Version::VERSION # Traditional Constant Location
  end
end
