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
   
  fixtures :all

    def sign_in(user:, password:)
    post user_session_path \
      "user[email]"    => user.email,
      "user[password]" => user.password
  end

  def sign_out(user)
  	delete destroy_user_session_path
  end

end