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
Administrator_params = {
  name: 'Admin User',
  cpf: '12345678901',
  email: 'admin@example.com',
  role: 1, # Role 1 representa um administrator
  state: 'RJ',
  cep: '20000000',
  street: 'Rua',
  number: 1,
  password: 'Admin@123',
  password_confirmation: 'Admin@123'
}.freeze

# Criar um usuário com role 2 (Employee)
employee_params = {
  name: 'Employee User',
  cpf: '16489301214',
  email: 'Employee@example.com',
  role: 2, # Role 2 representa um Employee
  state: 'RJ',
  cep: '20000000',
  street: 'Rua',
  number: 1,
  password: 'Employee@123',
  password_confirmation: 'Employee@123'
}

User.create(employee_params)

# Criar um usuário com role 3 (Client)
{
  name: 'Admin User',
  cpf: '16489301744',
  email: 'client@example.com',
  role: 3,  # Role 3 representa um Client
  state: 'RJ',
  cep: '20000000',
  street: 'Rua',
  number: 1,
  password: 'client@123',
  password_confirmation: 'client@123'
}
