class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:id]) if session[:id]
  end

  def server_errors
    render status: :internal_server_error
  end

  def search_errors
    render status: :bad_request
  end
end
