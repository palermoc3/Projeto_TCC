# frozen_string_literal: true

class PurchaseSerializer < ActiveModel::Serializer
  attributes :id, :price, :paid, :packSize, :packPrice, :receive, :user_info
  belongs_to :item_purchases, serializer: ItemPurchaseSerializer

  def user_info
    {
      user_id: object.user.id,
      user_cpf: object.user.cpf
    }
  end
end
