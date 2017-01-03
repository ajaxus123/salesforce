require "test_helper"

class SiteLayoutTestTest < ActionDispatch::IntegrationTest

	def setup
		@password = "password"
		@admin = User.create( email: "mbekker@usn.co.za", password: @password, admin: true )
		@user = User.create( email: "fheunis@usn.co.za", password: @password)
		
	end

	test "index page navbar layout logged out user" do
		get '/'
		assert :success
		assert_select "a[href=?]", root_path
   		assert_select "a[href=?]", new_user_session_path
    	assert_select "a[href=?]", '/#service'
    	assert_select "a[href=?]", '/#banner'
    	assert_select "a[href=?]", '/#feature'
    	assert_select "a[href=?]", '/#utility'
	end

	test "index page navbar layout logged in user" do
		get '/'
		assert :success
		sign_in(user: @user, password: @password)
		assert_redirected_to dashboard_path
		get '/'
		assert_select "a[href=?]", root_path
   		assert_select "a[href=?]", destroy_user_session_path
    	assert_select "a[href=?]", '/#service'
    	assert_select "a[href=?]", '/#banner'
    	assert_select "a[href=?]", '/#feature'
    	assert_select "a[href=?]", '/#utility'
	end
end
	



    
