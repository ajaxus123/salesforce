require "test_helper"

class SiteLayoutTestTest < ActionDispatch::IntegrationTest

	def setup
		@password = "password"
		@admin = User.create( email: "mbekker@usn.co.za", password: @password, admin: true )
	end

	test "index page layout" do
		get '/'
		assert :success
		assert_select "a[href=?]", root_path
   		assert_select "a[href=?]", new_user_session_path
    	assert_select "a[href=?]", '/#service'
    	assert_select "a[href=?]", '/#banner'
    	assert_select "a[href=?]", '/#feature'
    	assert_select "a[href=?]", '/#utility'
	end

	test "admin layout links" do
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
	end

end



    
