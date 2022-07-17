class Api::V1::TokensController < ApplicationController
  before_action :set_user, only: [:create]

  def create
    if @user&.authenticate(user_params[:password])
      render json: { token: JsonWebToken.encode(user_id: @user.id), username: @user.username}
    else
      render json: { error: "wrong username or passsword!" }, status: :unauthorized
    end
  end

  def destroy

  end

  private

  def set_user
    @user = User.find_by_username(user_params[:username])
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
