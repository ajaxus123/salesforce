require "test_helper"

class StoreTest < ActiveSupport::TestCase
    def setup
       @user = User.create( email: "mbekker@usn.co.za", password: @password)    
       @store = Store.new(storename: "PNP Hyper", user_id: 1, storecode: "HC06", contactname: "Maropong", phonenumber: '0514005123',
                            latitude: "-29.109525", longitude: "26.201562")
    end
    
    test "should be valid" do
      assert @store.valid?
    end

    test "store id should be present" do
      @store.user_id = nil
      assert_not @store.valid?
  end
  
  test "store name should be present" do
    @store.storename = "  "
    assert_not @store.valid?
  end
  
  test "store code should be present" do
    @store.storecode = "  "
    assert_not @store.valid?
  end
  
  test "store contact name should be present" do
    @store.contactname = "  "
    assert_not @store.valid?
  end
 
  test "store phone number should be present" do
    @store.phonenumber = "  "
    assert_not @store.valid?
  end
 
 test "store number should not exceed 10 characters" do
    @store.phonenumber = "2" * 11
    assert_not @store.valid?
 end
 
 test "store number should not be less than 10 characters" do
    @store.phonenumber = "2" * 8   
 end
 
 test "store code should not exceed 5 characters" do
     @store.storecode = "1" * 6
     assert_not @store.valid?
 end
 
 test "phonenumber validation should accept valid number" do
    valid_numbers = %w[0847076391 0828109008]
    valid_numbers.each do |valid_number|
    @store.phonenumber = valid_number
    assert @store.valid?, "#{valid_number.inspect}, should be valid"
   end
  end
 
 test "phoneumber validation should reject invalid numbers" do
    invalid_numbers = %w[pho3711231 abc1234567]
    invalid_numbers.each do |invalid_number|
    @store.phonenumber = invalid_number
    assert_not @store.valid?, "#{invalid_number.inspect}, should be invalid"
   end
 end
 
 test "latitude should be present" do
   @store.latitude = ""
   assert_not @store.valid?
  end
 
 test "longitude should be present" do
   @store.longitude = ""
   assert_not @store.valid?
 end

end
