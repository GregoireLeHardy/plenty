class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user: user || :published)
      end
    end
  end

  def project_params_user?
    return true
  end

  def new?
    return true
  end

  def create?
    return true
  end

  def show?
    return true
  end

  def update?
    record.user == user || user.admin == true
  end

  def find_project?
    return true
  end

  def publish?
    user.admin == true
  end

  def dashboard
    return true
  end
end
