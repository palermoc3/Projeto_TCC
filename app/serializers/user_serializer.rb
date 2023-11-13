# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :cpf, :email, :state, :cep, :street, :number
end
