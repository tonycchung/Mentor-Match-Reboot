require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get profile" do
    get :profile
    assert_response :success
  end

  test "should get mentors" do
    get :mentors
    assert_response :success
  end

  test "should get mentees" do
    get :mentees
    assert_response :success
  end

end
