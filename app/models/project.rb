class Project < ApplicationRecord
  include Filterable
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
  validate :photo_validation

  def photo_validation
    errors.add :photo, "no pics !!!" unless photo.attached?
    if photo.attached?
      if photo.blob.byte_size > 1000000
        photo.purge
        errors[:base] << 'Too big'
      elsif !photo.blob.content_type.starts_with?('image/')
        photo.purge
        errors[:base] << 'Wrong format'
      end
    end
  end
end
