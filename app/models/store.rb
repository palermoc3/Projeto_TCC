class Store < ApplicationRecord
  belongs_to :administrator
  has_many :abouts
  
end
