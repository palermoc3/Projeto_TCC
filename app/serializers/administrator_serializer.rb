# frozen_string_literal: true

class AdministratorSerializer < ActiveModel::Serializer
  # Inclui as informações do usuário
  belongs_to :user, serializer: UserSerializer

  attributes :id, :cnpj
end
