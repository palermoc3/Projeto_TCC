# frozen_string_literal: true

class SubCategory < ApplicationRecord
  belongs_to :category
  has_many :products
  after_create :increment_category_quantity

  before_validation :set_default_quantity

  validates :name, presence: { message: 'Não pode ser vazio' },
                   format: { with: /\p{L}+/, message: 'Deve conter apenas letras' }, uniqueness: { message: 'Esse nome já foi cadastrado.' }
  validates :category, presence: { message: 'Deve ser associado a uma categoria' }

  private

  def set_default_quantity
    self.quantity ||= 0
  end

  def increment_category_quantity
    category.increment!(:quantity)
  end
end
