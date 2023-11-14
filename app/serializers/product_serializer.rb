class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :weight, :width, :length, :valueSell, :valueBuy, :depth, :quantity, :description
  has_one :subcategory
end
