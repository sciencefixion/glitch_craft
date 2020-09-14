class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:id]) if session[:id]
  end

  private
  
  def require_user
    render file: '/public/404' if current_user.nil?
  end
end
