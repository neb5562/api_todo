class Api::V1::TokensController < ApplicationController
  before_action :set_user, only: [:create, :log_out]

  def create
    if @user&.authenticate(user_params[:password])
      render json: { token: JsonWebToken.encode(user_id: @user.id), username: @user.username}
    else
      render json: { error: "wrong username or passsword!" }, status: :unauthorized
    end
  end

  def log_out
    expire = Time.at(JsonWebToken.decode(request.headers['Authorization'])['exp'])
    if DenyToken.create(token: JsonWebToken.encode(user_id: @user.id), expire: expire)
      render json: { message: "log out success!" }, status: :ok
    end
  end

  private

  def set_user
    @user = User.find_by_username(user_params[:username])
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
