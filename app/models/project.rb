class Project < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_name, against: :name, using: { tsearch: { any_word: true } }

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
  monetize :price_cents

  scope :recent, -> { order("created_at DESC") }
  #scope :active, -> { where(id: 13) }
  scope :category, -> (categories) { joins(:categories).where('categories.name': categories).distinct }

  def photo_validation
    errors.add :photo, "no pics !!!" unless photo.attached?
    if photo.attached?
      if photo.blob.byte_size > 100000000000
        photo.purge
        errors[:base] << 'Too big'
      elsif !photo.blob.content_type.starts_with?('image/')
        photo.purge
        errors[:base] << 'Wrong format'
      end
    end
  end

  def calculate_points
    followers.count + payments.count   # + sharings.count
  end

  def followers
    users
  end

  def followed_by?(user)
    (followers || []).include?(user)
  end
end
