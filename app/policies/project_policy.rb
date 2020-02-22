class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(published: true)
      end
    end
  end

# class PostPolicy < ApplicationPolicy
#   def permitted_attributes
#     if user.admin? || user.owner_of?(post)
#       [:title, :body, :tag_list]
#     else
#       [:tag_list]
#     end
#   end
# end
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
