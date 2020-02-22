class FollowerProjectsController < ApplicationController
  def create
    @project = Project.find(params_project_id)
    current_user.following_projects << @project
    respond_to do |format|
      format.html { redirect_to @project }
      format.js
      format.json { render json: { is_followed: @project.followed_by?(current_user) } }
    end
    authorize @project
  end

  def destroy
    @project = Project.find(params_project_id)
    current_user.unfollow(@project)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
    authorize @follower_project
  end

  private

  def params_project_id
    params.require(:follower_project).permit(:project_id)[:project_id]
  end
end
