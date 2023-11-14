# frozen_string_literal: true

class SubCategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :quantity
  belongs_to :category, serializer: CategorySerializer
end
