class ArticlesController < ApplicationController

  def index
    @articles = Article.all
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

# app/controllers/articles_controller.rb
  def article_params
   params.require(:article).permit(:title, :description, :photo)
  end
end
