# frozen_string_literal: true

class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :weight, :width, :length, :valueSell, :valueBuy, :depth, :quantity, :description
  belongs_to :sub_category
  attribute :photo_info
  def photo_info
    {
      filename: object.photo1.filename,
      filename: object.photo2.filename,
      filename: object.photo3.filename
    }
  end
end
