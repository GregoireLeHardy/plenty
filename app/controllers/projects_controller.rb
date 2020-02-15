class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @projects = policy_scope(Project)
    @projects = filtered_projects
  end

  def show
    find_project
    @donation = Donation.new(project_id: @project.id)
    authorize @project
  end

  def create
    @project = Project.new(project_params_user)
    if @project.save!
      redirect_to project_path(@project)
      authorize @project
    else
    end
  end

  def new
    @categories = Category.all
    @project = Project.new
    authorize @project
  end

  def create_article
    redirect_to new_project_article_path
  end

  def publish
    find_project
    @project.published == TRUE
  end

  private

  def project_params_user
    project_params.merge(user_id: current_user.id)
    authorize @project
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
    authorize @project
  end
end
