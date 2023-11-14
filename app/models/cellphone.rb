class Cellphone < ApplicationRecord
  belongs_to :user

  validates :number, presence: true, length: { is: 11 }, if: :tipo_true?
  validates :number, presence: true, length: { is: 10 }, unless: :tipo_true?

  private

  def tipo_true?
    kind == true
  end

end
