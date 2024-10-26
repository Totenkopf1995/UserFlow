# test/controllers/users_controller_test.rb
require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)  # Load an existing user from fixtures
  end

  test "should get index" do
    get users_url, as: :json
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count", 1) do
      post users_url, params: { user: { email: "new_user@example.com", name: "New User", password: "password" } }, as: :json
    end

    assert_response :created  # Make sure the answer is 201 Created
  end

  test "should show user" do
    get user_url(@user), as: :json
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { email: "updated_email@example.com", name: "Updated Name", password: "new_password" } }, as: :json
    assert_response :success  # Make sure the answer is successful (200 OK)
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete user_url(@user), as: :json
    end

    assert_response :no_content  # Make sure the answer is 204 No Content
  end
end