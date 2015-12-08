require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  test "login as user" do
    puts __method__
    post :create, :session => {:login => "test1", :password => "pass"}
    assert_redirected_to home_path

    post :create, :session => {:login => "test2", :password => "pass"}
    assert_redirected_to home_path
  end

  test "not login as user" do
    puts __method__
    puts "\t- wrong password"
    post :create, :session => {:login => "test2", :password => "pass2"}
    assert_redirected_to login_path

    puts "\t- wrong username"
    post :create, :session => {:login => "test", :password => "pass"}
    assert_redirected_to login_path

    puts "\t- everything is wrong"
    post :create, :session => {:login => "test", :password => "pass2"}
    assert_redirected_to login_path

  end

  test "logging out" do
    puts __method__
    delete :destroy
    assert_redirected_to root_url
  end

end
