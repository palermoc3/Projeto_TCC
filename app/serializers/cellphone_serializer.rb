# frozen_string_literal: true

class CellphoneSerializer < ActiveModel::Serializer
  attributes :id, :number, :cellphone_type

  def cellphone_type
    if object.kind?
      'Celular'
    else
      'Residencial'
    end
  end
end
