class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:id]) if session[:id]
  end

  def server_errors
     render status: 500
  end

  def search_errors
     render status: 400
  end
end
