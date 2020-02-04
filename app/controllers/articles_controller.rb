class ArticlesController < ApplicationController

  def new
   @project = Project.find(params[:project_id])
   @article = Article.new
  end

# app/controllers/articles_controller.rb
  def article_params
   params.require(:article).permit(:title, :description, :photo)
  end
end
