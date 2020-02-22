class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    return true
  end

  def edit?
    update?
  end

  def update?
    record.project.user == user || user.admin == true
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

