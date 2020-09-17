class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(request.env['omniauth.auth'])
    session[:id] = user.id
    flash[:success] = "Welcome, #{user.name}!"

    redirect_to '/dashboard'
  end

  def destroy
    session.delete(:id) if current_user
    session.delete(:id)
    session[:id] = nil
    redirect_to root_path
    flash[:success] = 'You have successfully logged out'
  end
end
