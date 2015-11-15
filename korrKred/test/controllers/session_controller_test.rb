require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  test "login as user" do
    post :create, :session => {:login => "test1", :password => "pass"}
    assert_redirected_to home_path
  end

  test "not login as user" do
    post :create, :session => {:login => "test2", :password => "pass2"}
    assert_redirected_to login_path
  end

  test "logging out" do
    delete :destroy
    assert_redirected_to root_url
  end

end
