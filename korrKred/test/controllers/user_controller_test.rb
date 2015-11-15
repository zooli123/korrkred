require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "creating new user" do
    assert_difference("User.count") do
      post :create, user: { login: "valami", firstname: "ff", lastname: "ll", password: "passw"}
    end
    assert_redirected_to home_path
  end

  test "not creating new user" do
    assert_no_difference("User.count") do
      post :create, user: { login: "test1", firstname: "ff", lastname: "ll", password: "passw"}
    end
    assert_redirected_to signup_path
  end


end
