class Payment < ApplicationRecord
  belongs_to :donation
  has_one :user
end
