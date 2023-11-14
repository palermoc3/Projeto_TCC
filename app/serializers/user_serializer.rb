# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :cpf, :email, :state, :cep, :street, :number
  attribute :role_description

  # Adicionar informações do Employee se estiver associado
  attribute :employee_info, if: -> { object.employee.present? }

  # Adicionar informações do Administrator se estiver associado
  attribute :administrator_info, if: -> { object.administrator.present? }

  def employee_info
    {
      ctps: object.employee.ctps,
      salary_base: object.employee.salary_base,
      hours: object.employee.hours,
      commission_percent: object.employee.commission_percent
    }
  end

  def administrator_info
    {
      cnpj: object.administrator.cnpj
    }
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
