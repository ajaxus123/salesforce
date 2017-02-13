require "test_helper"

class StoresControllerTest < ActionDispatch::IntegrationTest

	def setup
		@password = "password"
		@hyper = stores(:hyper)
		@kloppers = stores(:kloppers)
		@user = User.create(email: "ewald@usn.co.za", password: @password)
		@other_user = User.create(email: "lou@usn.co.za", password: @password)
		@admin = User.create(email: "mbekker@usn.co.za", password: @password, admin: true)
	end

	test "Store with lat lon should return address" do
		@hyper.save		
		assert_not @hyper.address.nil?, "address wasn't successfully geocoded"
		@kloppers.save
		assert_not @kloppers.address.nil?, "address wasn't successfully geocoded"
	end

	test "Only user with correct id can view store" do
		sign_in(user: @user, password: @password)
		@hyper.save
		assert_equal @hyper.user_id, @user.id
		sign_out(user: @user)
		sign_in(user: @other_user, password: @pssword)
		assert_not_equal @hyper.user_id, @other_user.id
		@kloppers.save
		assert_equal @kloppers.user_id, @other_user.id
	end
end
