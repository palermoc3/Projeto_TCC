# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :sub_category
  has_many :item_purchases
  belongs_to :sub_category
  after_create :increment_sub_category_quantity

  validates :name, presence: { message: 'Não pode ser vazio' }
  validates :sub_category, presence: { message: 'Deve ser associado a uma categoria' }
  validates :weight, :width, :length, :valueBuy, :valueSell, :depth, :quantity,
            numericality: { greater_than: 0, message: 'Deve ser maior que zero' }
  validates :valueSell, numericality: { greater_than: :valueBuy, message: 'deve ser maior do que o valor de compra' }

  def increment_sub_category_quantity
    sub_category.increment!(:quantity)
  end
end
