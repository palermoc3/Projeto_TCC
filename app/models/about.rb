# frozen_string_literal: true

class About < ApplicationRecord
  belongs_to :store
  validates :title, presence: { message: 'Não pode ser vazio' }
end
