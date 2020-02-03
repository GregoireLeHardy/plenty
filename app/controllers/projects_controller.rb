 class ProjectsController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @projects = Project.all
  end

  def show
    find_project
  end

  def create
    @project = Project.new(project_params_user)
    if @project.save!
      redirect_to project_path(@project)
    else
    end
  end

  def new
    @project = Project.new
  end

private

  def project_params_user
    project_params.merge(user_id: current_user.id)
  end

  def project_params
    params.require(:project).permit(:name, :short_description, :long_description, :photo)
  end

  def find_project
    @project = Project.find(params[:id])
  end
end