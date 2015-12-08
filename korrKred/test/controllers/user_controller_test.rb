require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get new page" do
    puts __method__
    get :new
    assert_response :success
  end

  test "creating new user" do
    puts __method__
    assert_difference("User.count", 1 ,"Should create new user named 'valami'") do
      post :create, user: { login: "valami", firstname: "ff", lastname: "ll", password: "passw"}
    end
    assert_redirected_to home_path
  end

  test "not creating new user" do
    puts __method__
    puts "\t- login name exists"
    assert_no_difference("User.count", "User with name 'test1' already exists. Shouldn't create another.") do
      post :create, user: { login: "test1", firstname: "ff", lastname: "ll", password: "passw"}
    end
    assert_redirected_to signup_path

    puts "\t- parameters: login name"
    assert_no_difference("User.count", "Must give all parameters to create user.") do
      post :create, user: {login: "test"}
    end
    assert_redirected_to signup_path

    puts "\t- parameters: login name, firstname"
    assert_no_difference("User.count", "Must give all parameters to create user.") do
      post :create, user: {login: "test", firstname: "ff"}
    end
    assert_redirected_to signup_path

    puts "\t- parameters: login name, firstname, password"
    assert_no_difference("User.count", "Must give all parameters to create user.") do
      post :create, user: {login: "test", firstname: "ff", password: "passw"}
    end
    assert_redirected_to signup_path

    puts "\t- parameters: login name, firstname, lastname"
    assert_no_difference("User.count", "Must give all parameters to create user.") do
      post :create, user: {login: "test", firstname: "ff", lastname: "ll"}
    end
    assert_redirected_to signup_path
  end
end
