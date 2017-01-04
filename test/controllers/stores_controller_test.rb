require "test_helper"

class StoresControllerTest < ActionDispatch::IntegrationTest

	def setup
		@hyper = stores(:hyper)
		@kloppers = stores(:kloppers)
	end

	test "Store with lat lon should return address" do
		@hyper.save		
		assert_not @hyper.address.nil?, "address wasn't successfully geocoded"
		@kloppers.save
		assert_not @kloppers.address.nil?, "address wasn't successfully geocoded"
	end
end
