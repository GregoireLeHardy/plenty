class ArticlesController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @articles = filtered_articles
  end

  def show
    @project = Project.find(params[:project_id])
    find_article
    authorize @article
  end

  def new
   @project = Project.find(params[:project_id])
   @article = Article.new
   authorize @article
  end

  def edit
    @project = Project.find(params[:project_id])
    find_article
    authorize @article
  end

  def update
    find_article
    @article.update(article_params)
    authorize @article

    redirect_to project_article_path(@article)
  end

  def create
    @project = Project.find(params[:project_id])
    @article = Article.new(article_params)
    @article.project = @project
    if @article.save!
      redirect_to project_article_path(@project, @article)
    else
      render 'new'
    end
    # @bikes = Bike.where(status: 'available')
    authorize @article
  end

  def recent
    @article = Article.recent
    render action: :index
    authorize @article
  end

  def active
    @article = Article.active
    render action: :index
    authorize @article
  end

# app/controllers/articles_controller.rb
  def article_params
    params.require(:article).permit(:title, :description, :photo)
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def filtered_articles
    if params[:filter] == 'recent'
      return @project.articles.recent
    elsif params[:filter] == 'active'
      return @project.articles.active
    else
      return @project.articles
    end
    authorize @article
  end
end
