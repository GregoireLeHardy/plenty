class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    return true
  end

  def create?
    record.project.user == user || user.admin == true
  end

  def show?
    return true
  end

  def recent?
    return true
  end

  def active?
    return true
  end

  def article_params?
    return true
  end

  def filtered_articles?
    return true
  end
end


# def index
#     @project = Project.find(params[:project_id])
#     @articles = filtered_articles
#   end

#   def show
#     @project = Project.find(params[:project_id])
#     @article = Article.find(params[:id])
#     authorize @article
#   end

#   def new
#    @project = Project.find(params[:project_id])
#    @article = Article.new
#    authorize @article
#   end

#   def create
#     @project = Project.find(params[:project_id])
#     @article = Article.new(article_params)
#     @article.project = @project
#     if @article.save!
#       redirect_to project_article_path(@project, @article)
#     else
#       render 'new'
#     end
#     # @bikes = Bike.where(status: 'available')
#     authorize @article
#   end

#   def recent
#     @article = Article.recent
#     render action: :index
#     authorize @article
#   end

#   def active
#     @article = Article.active
#     render action: :index
#     authorize @article
#   end

# # app/controllers/articles_controller.rb
#   def article_params
#     params.require(:article).permit(:title, :description, :photo)
#     authorize @article
#   end

#   private

#   def filtered_articles
#     if params[:filter] == 'recent'
#       return @project.articles.recent
#     elsif params[:filter] == 'active'
#       return @project.articles.active
#     else
#       return @project.articles
#     end
#     authorize @article
#   end
