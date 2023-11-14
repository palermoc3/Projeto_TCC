# frozen_string_literal: true

class ItemPurchaseSerializer < ActiveModel::Serializer
  attributes :id, :quantity
  has_one :product
  has_one :purchase
end
