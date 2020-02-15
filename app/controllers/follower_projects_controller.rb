class FollowerProjectsController < ApplicationController
  def create
    @project = Project.find(params_project_id)
    current_user.following_projects << @project
    respond_to do |format|
      format.html { redirect_to @project }
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

  private

  def params_project_id
    params.require(:follower_project).permit(:project_id)[:project_id]
  end
end
