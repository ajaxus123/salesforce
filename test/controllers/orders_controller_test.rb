require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
 
 test "should redirect non logged in user" do
        get '/orders'
        assert_redirected_to new_user_session_path
        assert_not flash.empty?
    end	
 
end
