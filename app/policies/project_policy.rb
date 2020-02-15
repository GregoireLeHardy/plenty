class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
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
end
