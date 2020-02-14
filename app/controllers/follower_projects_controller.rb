class FollowerProjectsController < ApplicationController
   def create
    @project = User.find(params[:id])
    current_user.follow(@project)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    @project = Relationship.find(params[:id]).followed
    current_user.unfollow(@project)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
end
