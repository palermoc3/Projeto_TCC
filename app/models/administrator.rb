# frozen_string_literal: true

class Administrator < ApplicationRecord
  belongs_to :user
  has_one :store
  after_create :update_user_role
  after_update :update_user_role

  validates :cnpj, presence: true, length: { is: 14 }, numericality: { only_integer: true }

  # Restante do modelo

  private

  def update_user_role
    user.update(role: 1) if user.present?
  end
end
