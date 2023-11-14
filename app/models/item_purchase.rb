# frozen_string_literal: true

class ItemPurchase < ApplicationRecord
  belongs_to :product
  belongs_to :purchase
end
