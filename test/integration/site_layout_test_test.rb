require "test_helper"

class SiteLayoutTestTest < ActionDispatch::IntegrationTest

	def setup
		@password = "password"
		@admin = User.create( email: "mbekker@usn.co.za", password: @password, admin: true )
		@manager = User.create( email: "fmaritz@usn.co.za", password: @password, manager: true )
		@user = User.create( email: "fheunis@usn.co.za", password: @password)
		@order_clerk = User.create( email: "leande@usn.co.za", password: @password, order_clerk: true )
		@return_clerk = User.create( email: "neo@usn.co.za", password: @password, return_clerk: true )
		 
	end

	test "index page navbar layout" do
		get '/'
		assert :success
		assert_select "a[href=?]", root_path
   		assert_select "a[href=?]", new_user_session_path
    	assert_select "a[href=?]", '/#service'
    	assert_select "a[href=?]", '/#banner'
    	assert_select "a[href=?]", '/#feature'
    	assert_select "a[href=?]", '/#utility'
	end

	test "admin nav layout links" do
		get '/admin'
		assert :success
		sign_in(user: @admin, password: @password)
		assert_redirected_to admin_path
		follow_redirect!
		assert_select "a[href=?]", admin_path
		assert_select "a[href=?]", dashboard_path
		assert_select 'a[href=?]', manager_path
		assert_select 'a[href=?]', orders_path
		assert_select 'a[href=?]', returns_path
		assert_select 'a[href=?]', destroy_user_session_path
		sign_out(@admin)
		assert_redirected_to root_path
	end

	test "manager nav layout links" do
		get '/manager'
		assert :success
		sign_in(user: @manager, password: @password)
		assert_redirected_to manager_path
		follow_redirect!
		assert_select "a[href=?]", manager_path
		assert_select "a[href=?]", destroy_user_session_path
		sign_out(@manager)
		assert_redirected_to root_path
	end

	test "user nav layout links" do
		get '/dashboard'
		assert :success
		sign_in(user: @user, password: @password)
		assert_redirected_to dashboard_path
		follow_redirect!
		assert_select "a[href=?]", dashboard_path
		assert_select "a[href=?]", destroy_user_session_path
		sign_out(@user)
		assert_redirected_to root_path
	end

	test "order_clerk nav layout links" do
		get '/orders'
		assert :success
		sign_in(user: @order_clerk, password: @password)
		assert_redirected_to orders_path
		follow_redirect!
		assert_select "a[href=?]", orders_path
		assert_select "a[href=?]", destroy_user_session_path
		sign_out(@order_clerk)
		assert_redirected_to root_path
	end

	test "return_clerk nav layout links" do
		get '/returns'
		assert :success
		sign_in(user: @return_clerk, password: @password)
		assert_redirected_to returns_path
		follow_redirect!
		assert_select "a[href=?]", returns_path
		assert_select "a[href=?]", destroy_user_session_path
		sign_out(@return_clerk)
		assert_redirected_to root_path
	end
end



    
