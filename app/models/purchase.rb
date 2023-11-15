# frozen_string_literal: true

class Purchase < ApplicationRecord
  belongs_to :user
  has_many :item_purchases
  # require 'correios_gem'
  def update_price
    self.price = item_purchases.sum { |item| item.quantity * item.product.valueBuy }
    save
  end

  def update_pack_size
    self.packSize = item_purchases.sum { |item| item.product.width * item.product.length * item.product.depth }
    save
  end

  # def update_pack_price
  # result = Correios::Pricefier.calculate_price({
  # service_codes: ['Não tenho', 'Não tenho'], Preciso de credencias oficiais para usar
  # source_zip_code: User.find_by_id(1).cep,
  # target_zip_code: user&.cep,
  # object: {
  #  type: :box,
  #  weight: self.packSize = item_purchases.sum { |item| item.product.width * item.product.length * item.product.depth },

  #  length: self.packSize = item_purchases.sum { |item|  item.product.length },
  #  height: self.packSize = item_purchases.sum { |item|  item.product.depth },
  #  width: self.packSize =  item_purchases.sum { |item|  item.product.width },
  #  diameter: nil
  # },
  # own_hands: true,
  # receipt_notification: false,
  # declared_value: self.price
  # })
  # end
end
