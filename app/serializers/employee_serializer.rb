# frozen_string_literal: true

class EmployeeSerializer < ActiveModel::Serializer
  # Inclui as informações do usuário
  belongs_to :user, serializer: UserSerializer

  attributes :id
end
