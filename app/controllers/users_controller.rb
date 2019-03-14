class UsersController < ApplicationController
  def show
    @title = "PROFILE"
  end

  def update
    current_user.update(user_params)
    redirect_to user_path(current_user)
  end

  private

  def user_params
    params.require(:user).permit(:photo)
  end
end
