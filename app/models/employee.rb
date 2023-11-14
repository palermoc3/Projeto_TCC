# frozen_string_literal: true

class Employee < ApplicationRecord
  belongs_to :user
  after_create :update_user_role
  after_update :update_user_role

  validates :ctps, numericality: { only_integer: true }, length: { is: 10 }

  private

  def update_user_role
    user.update(role: 2) if user.present?
  end
end
