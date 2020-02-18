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

  def edit
    find_project
    authorize @project
  end

  def update
    find_project
    @project.update(project_params)
    authorize @project

    redirect_to project_path(@project)
  end

  private

  def project_params_user
    project_params.merge(user_id: current_user.id)
  end

  def project_params
    permitted = [:name, :published, :short_description, :long_description, :photo, category_ids: []]
    permitted << :published if current_user.admin
    params.require(:project).permit(permitted)
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
