class Donation < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :payments
  monetize :price_cents
end
