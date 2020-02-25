class Category < ApplicationRecord
  has_many :projects, through: :project_categories
  has_many :project_categories

  def logo_class
    case name
    when 'Local' then "fas fa-globe-africa"
    when 'Humanitary' then "fas fa-people-carry"
    when 'Environment' then "fas fa-leaf"
    when 'Education' then "fas fa-book"
    else 'fas fa-plus'
    end
  end
end
