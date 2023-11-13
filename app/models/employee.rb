# frozen_string_literal: true

class Employee < ApplicationRecord
  belongs_to :user
  validates :ctps, numericality: { only_integer: true }, length: { is: 10 }
end
