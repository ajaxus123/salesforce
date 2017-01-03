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
  
  def login_user(user = users(:francois))
    post sessions_url, params: {
        session: { email: user.email, password: "password" } }
  end
  
end



