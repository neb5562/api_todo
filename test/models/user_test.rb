require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "user with valid username and password should be valid" do
    user = User.new(username: 'neb3', password_digest: "12345678")
    assert user.valid?
  end

  test "user with invalid username and password should be invalid" do
    user = User.new(username: 'ne', password_digest: "12348")
    assert_not user.valid?
  end

  test "user with duplicate username should be invalid" do
    other_user = users(:one)
    user = User.new(username: other_user.username, password_digest: "12345678")
    assert_not user.valid?
  end

end
