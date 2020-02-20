class Category < ApplicationRecord
  has_many :projects, through: :project_categories
  has_many :project_categories

  def logo_class
    "fas fa-people-carry"
  end
end
