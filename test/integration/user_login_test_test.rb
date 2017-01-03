require "test_helper"

    test "should redirect logged in user"
        get '/dashboard'
        assert_redirected_to new_user_session_path
        assert_not flash.empty?
        login_user(user)
    
