class Project < ApplicationRecord
  belongs_to :user
  has_many :articles
  has_many :donations
  has_one_attached :photo
  has_many :follower_projects
  has_many :project_categories
  has_many :users, through: :follower_projects
  has_many :categories, through: :project_categories
  has_many :payments, through: :donations

  validates :short_description, length: { maximum: 255 }
  validates :long_description, length: { maximum: 1500 }
  validates :name, presence: true
  validates :photo, presence: true
end
