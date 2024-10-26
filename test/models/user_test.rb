# test/models/user_test.rb
require "test_helper"

class UserTest < ActiveSupport::TestCase
  fixtures :users

  test "should save user with valid attributes" do
    user = User.new(name: "pepe perez", email: "pepe@example.com", password: "password")
    assert user.save, "User was not saved successfully"
  end

  test "should not save user without email" do
    user = User.new(name: "pepe perez", password: "password")
    assert_not user.save, "Saved the user without an email"
  end

  test "should not save user with duplicate email" do
    user1 = users(:one) # Load the first fixture
    user2 = User.new(name: "another_user", email: user1.email, password: "password")
    assert_not user2.save, "Saved the user with a duplicate email"
  end
end