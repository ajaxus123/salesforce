require 'test_helper'

class UserLoginTestTest < ActionDispatch::IntegrationTest
  
	def setup
		@user = users(:michael)
	end
  
	test "should redirect to logged in user" do
		get '/admin'
		assert_redirected_to new_user_session_path
		post login_url, params: { session: { email: @user.email, password: 'password' } }
		assert_redirected_to '/dashboard'
		get '/admin'
		assert_redirected_to root_path
		assert_not flash.empty?
		get '/manager'
		assert_redirected_to root_path
		assert_not flash.empty?
		get '/orders'
		assert_redirected_to root_path
		assert_not flash.empty?
		get '/returns'
		assert_redirected_to root_path
	end
  
	test "invalid login" do
    get '/login'
    assert_template 'sessions/new'
    post user_session_path, params: { session: { email: "", password: "" } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
  
end
