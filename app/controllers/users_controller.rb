class UsersController < ApplicationController
  before_action :require_user
  def show
    @user = User.find(current_user.id)
  end
end
