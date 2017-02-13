require "test_helper"

class StoresShowTest < ActionDispatch::IntegrationTest
    
    def setup
      @password = 'password'
      @user1 = User.create(email: "joe@usn.co.za", password: @password)
      @user2 = User.create(email: "joe2@usn.co.za", password: @password)
      @admin = User.create(email: "mbekker@usn.co.za", password: @password, admin: true)
      @manager = User.create(email: "mbekker@usn.co.za", password: @password, manager: true)
      @hyper = stores(:hyper)
      @kloppers = stores(:kloppers)
    end
    
end