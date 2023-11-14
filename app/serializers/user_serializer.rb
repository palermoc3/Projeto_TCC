# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :cpf, :email, :state, :cep, :street, :number
  attribute :role_description
  attribute :cellphones_info, if: -> { object.cellphones.any? }
  # Adicionar informações das generalizações se estiver associado
  attribute :employee_info, if: -> { object.employee.present? }
  attribute :administrator_info, if: -> { object.administrator.present? }
  def administrator_info
    {
      cnpj: object.administrator.cnpj
    }
  end

  def employee_info
    {
      ctps: object.employee.ctps,
      salary_base: object.employee.salary_base,
      hours: object.employee.hours,
      commission_percent: object.employee.commission_percent
    }
  end

  def cellphones_info
    object.cellphones.map do |cellphone|
      {
        id: cellphone.id,
        kind: cellphone.kind ? 'Celular' : 'Residencial',
        number: cellphone.number
        # Adicione outros atributos que deseja incluir
      }
    end
  end

  def role_description
    case object.role
    when 1
      'Administrador'
    when 2
      'Empregado'
    when 3
      'Cliente'
    end
  end
end
