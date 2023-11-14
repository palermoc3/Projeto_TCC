class Product < ApplicationRecord
  belongs_to :subcategory
  has_many :itempurchases
end
