class UserPolicy < ApplicationPolicy
  # [...]

  def dashboard?
    return true
  end
end
