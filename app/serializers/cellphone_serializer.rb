# frozen_string_literal: true

class CellphoneSerializer < ActiveModel::Serializer
  attributes :id, :number
  attribute :cellphone_type
  has_one :user

  def cellphone_type
    if object.kind?
      'Celular'
    else
      'Residencial'
    end
  end
end
