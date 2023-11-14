class SubCategory < ApplicationRecord
  belongs_to :Category
  has_many :products
end
