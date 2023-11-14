# frozen_string_literal: true

class ItemPurchase < ApplicationRecord
  belongs_to :product
  belongs_to :purchase
  after_save :update_purchase_price

  before_validation :set_default_quantity
  validates :product, presence: { message: 'Deve ser associado a um produto' }
  validates :purchase, presence: { message: 'Deve ser associado a uma compra' }

  private

  def set_default_quantity
    self.quantity ||= 1
  end

  def update_purchase_price
    purchase.update_price
  end
end
