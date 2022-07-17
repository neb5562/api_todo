require "test_helper"

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should show user" do
    get api_v1_user_url(@user), as: :json
    assert_response :success

    json_response = JSON.parse(self.response.body)
    assert_equal @user.username, json_response['username']
  end

  test "should create user" do
    assert_difference('User.count') do
      post api_v1_users_url, params: { user: { username: "neb5", password: "12345678", password_confirmation: "12345678" } }, as: :json
    end
    assert_response :created
  end

  test "should not create user with taken username" do
    assert_no_difference('User.count') do
      post api_v1_users_url, params: { user: { username: @user.username, password: '12345678', password_confirmation: "12345678" } }, as: :json
    end
    assert_response :unprocessable_entity
  end

end
