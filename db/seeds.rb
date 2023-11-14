# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

# Criar um usuário com role 1 (Administrator)
# Criação do usuário
administrator = User.create!(
  name: 'Nome do Usuário',
  cpf: '12345678901',
  email: 'admin@example.com',
  state: 'RJ',
  cep: '20000000',
  street: 'Rua',
  number: 1,
  password: 'Admin@123',
  password_confirmation: 'Admin@123'
)

# Criação do administrador associado ao usuário
Administrator.create!(
  user: administrator,
  cnpj: '12345678901234'
)

employee = User.create!(
  name: 'Employee User',
  cpf: '16489301214',
  email: 'employee@example.com',
  state: 'RJ',
  cep: '20000000',
  street: 'Rua',
  number: 1,
  password: 'Employee@123',
  password_confirmation: 'Employee@123'
)

# Criar um empregado associado ao usuário
Employee.create!(
  user: employee,
  ctps: '1234567890',
  salary_base: 6000.0,
  hours: 35,
  commission_percent: 7.5
)

# Criar um usuário com role 3 (Client)
User.create!(
  name: 'Admin User',
  cpf: '16489301744',
  email: 'client@example.com',
  state: 'RJ',
  cep: '20000000',
  street: 'Rua',
  number: 1,
  password: 'Client@123',
  password_confirmation: 'Client@123'
)
