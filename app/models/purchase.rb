class Purchase < ApplicationRecord
  belongs_to :user
  has_many :itempurchases
  has_one :purchase
end
