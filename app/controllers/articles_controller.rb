class ArticlesController < ApplicationController

  def index
    @project = Project.find(params[:project_id])
    @articles = filtered_articles
  end

  def show
    @project = Project.find(params[:project_id])
    @article = Article.find(params[:id])
  end

  def new
   @project = Project.find(params[:project_id])
   @article = Article.new
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
  end

  def recent
    @article = Article.recent
    render action: :index
  end

  def active
    @article = Article.active
    render action: :index
  end

# app/controllers/articles_controller.rb
  def article_params
   params.require(:article).permit(:title, :description, :photo)
  end

  private

  def filtered_articles
    if params[:filter] == 'recent'
      return @project.articles.recent
    elsif params[:filter] == 'active'
      return @project.articles.active
    else
      return @project.articles
    end
  end
end
