# frozen_string_literal: true

class PurchaseSerializer < ActiveModel::Serializer
  attributes :id, :price, :paid
  has_one :user
end
