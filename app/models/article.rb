class Article < ApplicationRecord
  has_one_attached :photo
  belongs_to :project, counter_cache: true

  validates :photo, presence: true
  validates :description, presence: true
  validates :title, presence: true
  validate :photo_validation

  scope :recent, -> { order("created_at DESC") }
  #scope :active, -> { where(id: 13) }


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
