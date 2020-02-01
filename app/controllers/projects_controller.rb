class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params_user)
    if @project.save!
      redirect_to projects_path
    else
    end
  end

  def new
    @project = Project.new
  end

end
