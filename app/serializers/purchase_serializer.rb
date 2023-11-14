# frozen_string_literal: true

class PurchaseSerializer < ActiveModel::Serializer
  attributes :id, :price, :paid, :packSize, :packPrice, :receive
  has_one :user
end
