class Purchase < ApplicationRecord
  belongs_to :user
  has_many :item_purchases

  def update_price
    self.price = item_purchases.sum { |item| item.quantity * item.product.valueBuy }
    save
  end
end