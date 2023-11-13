# frozen_string_literal: true

class Employee < User
  validates :ctps, numericality: { only_integer: true }, length: { is: 10 }
end
