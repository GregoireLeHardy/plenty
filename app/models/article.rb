class Article < ApplicationRecord
  has_one_attached :photo
  belongs_to :project

  validates :photo, presence: true
  validates :description, presence: true
  validates :title, presence: true
end
