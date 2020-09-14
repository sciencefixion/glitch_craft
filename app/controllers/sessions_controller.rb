class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(request.env['omniauth.auth'])
    session[:id] = user.id
    flash[:success] = "Welcome #{user.name}"

    redirect_to '/dashboard'
  end

  def destroy
    if current_user
      session.delete(:user_id)
    end
    redirect_to root_path
  end
end
