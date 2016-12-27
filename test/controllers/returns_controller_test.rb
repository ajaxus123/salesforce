require 'test_helper'

class ReturnsControllerTest < ActionDispatch::IntegrationTest
  
  test "should redirect non logged in user" do
        get '/returns'
        assert_redirected_to new_user_session_path
        assert_not flash.empty?
    end	
  
end
