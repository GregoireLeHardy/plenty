class Project < ApplicationRecord
  belongs_to :user
  has_many :articles
  has_many :donations
  has_many :follower_projects
  has_many :project_categories
  has_many :users, through: :follower_projects
  has_many :categories, thourgh: :project_categories
  has_many :payments, through: :donations
end
