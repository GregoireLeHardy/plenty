class Category < ApplicationRecord
  has_many :projects, through: :project_categories
  has_many :project_categories

  def logo_class
    case name
    when 'social' then "fas fa-people-carry"
    when 'humanitary' then "fas fa-pen"
    when 'nature' then "fas fa-tree"
    when 'education' then "fas fa-car"
    else 'fas fa-plus'
    end
  end
end
