# frozen_string_literal: true

# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require_relative "../test/dummy/config/environment"
require "rails"
require "minitest/autorun"
require "rails/test_help"
require "active_support/core_ext/securerandom"
require "activestorage-aliyun"

ENV["BACKTRACE"] = "1"
ENV["RUBYOPT"] = "-W0"

# Load fixtures from the engine
if ActiveSupport::TestCase.respond_to?(:fixture_path=)
  ActiveSupport::TestCase.fixture_path = File.expand_path("fixtures", __dir__)
  ActionDispatch::IntegrationTest.fixture_path = ActiveSupport::TestCase.fixture_path
  ActiveSupport::TestCase.file_fixture_path = "#{ActiveSupport::TestCase.fixture_path}/files"
  ActiveSupport::TestCase.fixtures :all
end

module ActiveSupport
  class TestCase
    def download_file(url)
      Net::HTTP.get_response(URI.parse(url))
    end
  end
end
