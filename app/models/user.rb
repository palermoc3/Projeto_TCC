# frozen_string_literal: true

class User < ApplicationRecord
     has_secure_password
  before_validation :set_default_role

  validates :name, :cpf, :email, :cep, :street, :number, :state,
            presence: { message: 'Não pode ser vazio' }

  validates :name, format: { with: /\p{L}+/, message: 'Deve conter apenas Letras' }
  
  validates :cpf, uniqueness: { message: "Esse CPF já foi cadastrado." }

  validates :cpf, length: { is: 11, message: 'Deve ter exatamente 8 dígitos' }

  validates :cpf, format: { with: /\A\d+\z/, message: 'deve conter apenas algarismos' }

  validates :email, presence: true,
                    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: 'formato de e-mail inválido' }

  validates :state, inclusion: { in: %w[AC AL AP AM BA CE DF ES GO MA MT MS MG PA PB PR PE PI RJ RN RS RO RR SC SP SE TO],
                                 message: '%<value>s não é uma sigla válida de estado brasileiro' }
  validates :cep, length: { is: 8, message: 'deve ter exatamente 8 dígitos' }

  validates :cep, format: { with: /\A\d+\z/, message: 'deve conter apenas algarismos' }

  private

  def set_default_role
    self.role ||= 3
  end
end
