class ProjectsController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @projects = Project.all
    @projects = filtered_projects
  end

  def show
    find_project
    @donation = Donation.new(project_id: @project.id)
  end

  def create
    @project = Project.new(project_params_user)
    if @project.save!
      redirect_to project_path(@project)
    else
    end
  end

  def new
    @categories = Category.all
    @project = Project.new
  end

  def create_article
    redirect_to new_project_article_path
  end

  private

  def project_params_user
    project_params.merge(user_id: current_user.id)
  end

  def project_params
    params.require(:project).permit(:name, :short_description, :long_description, :photo, category_ids: [])
  end

  def find_project
    @project = Project.find(params[:id])
  end

  def filtered_projects
    @projects = Project.all
    @projects = @projects.recent if params[:filter] == 'recent'
    @projects = @projects.active if params[:filter] == 'active'
    @projects = @projects.category(params[:categories]) if params[:categories].present?
    return @projects
  end
end
