class Donation < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :payments
end
