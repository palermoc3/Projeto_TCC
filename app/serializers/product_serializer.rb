class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :weight, :width, :length, :valueSell, :valueBuy, :depth, :quantity, :description
  belongs_to :sub_category
end
