require "test_helper"
ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/reporters"
Minitest::Reporters.use!(
    Minitest::Reporters::SpecReporter.new,
    ENV,
    Minitest.backtrace_filter
)

class ActionController::TestCase
  fixtures :all
end

class ActionDispatch::IntegrationTest
   include Devise::Test::IntegrationHelpers
end