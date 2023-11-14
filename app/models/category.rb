# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :sub_categories
  before_validation :set_default_quantity
  validates :name, presence: { message: 'Não pode ser vazio' },
                   format: { with: /\p{L}+/, message: 'Deve conter apenas letras' }, uniqueness: { message: 'Esse nome já foi cadastrado.' }

  enum name: {
    electronics: 'Electronics',
    computers_and_accessories: 'Computers and Accessories',
    commerce: 'Commerce',
    home: 'Home',
    leisure_and_entertainment: 'Leisure and Entertainment',
    automotive: 'Automotive',
    toys: 'Toys',
    sports: 'Sports',
    health_and_wellness: 'Health and Wellness',
    fashion_and_beauty: 'Fashion and Beauty'
  }

  validates :name, inclusion: { in: names.keys.map(&:to_s) }

  private

  def set_default_quantity
    self.quantity ||= 0
  end
end
