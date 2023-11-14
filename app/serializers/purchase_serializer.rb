class PurchaseSerializer < ActiveModel::Serializer
  attributes :id, :price, :paid
  has_one :user
end
