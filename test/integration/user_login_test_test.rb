require 'test_helper'

class UserLoginTestTest < ActionDispatch::IntegrationTest
  
	def setup
		@password = "password"
		@user = User.create( email: "fheunis@usn.co.za", password: @password )
		@wrong_password = "perd"
		@admin = User.create( email: "mbekker@usn.co.za", password: @password, admin: true )
		@order_clerk = User.create( email: "leande@usn.co.za", password: @password, order_clerk: true )
		@return_clerk = User.create( email: "neo@usn.co.za", password: @password, return_clerk: true )
		@manager = User.create( email: "fmaritz@usn.co.za", password: @password, manager: true )
	end
  
	test "normal user access and redirect" do
		get '/admin'
		assert_redirected_to new_user_session_path
		sign_in(user: @user, password: @password)
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
		get '/dashboard'
		assert :success
		sign_out(user: @user)
		assert_redirected_to root_path
	end

 	test "admin access and redirect" do
 		get '/admin'
 		assert_redirected_to new_user_session_path
 		sign_in(user: @admin, password: @password)
 		assert_redirected_to '/admin'
 		assert_not flash.nil?
 		get '/dashboard'
 		assert :success
 		get '/manager'
 		assert :success
 		get '/orders'
 		assert :success
 		get '/returns'
 		assert :success
 		get '/admin'
 		sign_out(user: @user)
 		assert_redirected_to root_path
 		assert_not flash.empty?
 	end

 	test "order clerk access and redirect" do
 		get '/orders'
 		assert_redirected_to new_user_session_path
 		sign_in(user: @order_clerk, password: @password)
 		assert_redirected_to '/orders'
 		assert_not flash.nil?
 		get '/admin'
		assert_redirected_to root_path
		assert_not flash.nil?
		get '/manager'
		assert_redirected_to root_path
		assert_not flash.nil?
		get '/returns'
		assert_redirected_to root_path
		assert_not flash.nil?
		get '/dashboard'
		assert_redirected_to root_path
		assert_not flash.nil?
		get '/orders'
		assert :success
		sign_out(user: @order_clerk)
		assert_redirected_to root_path
		assert_not flash.empty?
	end

	test "return clerk access and redirect" do
		get '/returns'
		assert_redirected_to new_user_session_path
		sign_in(user: @return_clerk, password: @password)
		assert_redirected_to '/returns'
		assert_not flash.nil?
		get '/admin'
		assert_redirected_to root_path
		assert_not flash.nil?
		get '/orders'
		assert_redirected_to root_path
		assert_not flash.nil?
		get '/manager'
		assert_redirected_to root_path
		assert_not flash.nil?
		get '/dashboard'
		assert_redirected_to root_path
		assert_not flash.nil?
		get '/returns'
		assert :success
		sign_out(user: @return_clerk)
		assert_redirected_to root_path
		assert_not flash.empty?

	end

	test "manager access and redirect" do
		get '/manager'
		assert_redirected_to new_user_session_path
		sign_in(user: @manager, password: @password)
		assert_redirected_to '/manager'
		assert_not flash.nil?
		get '/admin'
		assert_redirected_to root_path
		assert_not flash.nil?
		get '/orders'
		assert_redirected_to root_path
		assert_not flash.nil?
		get '/dashboard'
		assert_redirected_to root_path
		assert_not flash.nil?
		get '/returns'
		assert_redirected_to root_path
		assert_not flash.nil?
		get '/manager'
		assert :success
		sign_out(user: @manager)
		assert_redirected_to root_path
		assert_not flash.nil?
	end


	test "should should flash wrong email/password" do
		get '/login'  
 		sign_in(user: @user, password: @wrong_password)
 		assert_not flash.empty?
 	end

end