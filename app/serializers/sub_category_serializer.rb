class SubCategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :quantity
  has_one :Category
end
