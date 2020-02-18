class UsersController < ApplicationController
  def dashboard
    if !current_user
      redirect_to new_user_registration_path
    else
      @user = current_user
    end
    authorize @user
  end
end
