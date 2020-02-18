class FollowerProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def destroy?
    return true
  end

  def params_project_id
    return true
  end

  def dashboard
    return true
  end
end
