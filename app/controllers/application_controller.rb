class ApplicationController < ActionController::API
  include Authenticable
  before_action :check_deny_list


  private 
  
  def check_deny_list
    head :unauthorized unless current_user || DenyToken.find_by(token: JsonWebToken.encode(user_id: current_user.id))
  end
end
