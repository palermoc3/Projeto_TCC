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
  name: "Admin User",
  cpf: "12345678901",
  email: "admin@example.com",
  role: 1,  # Role 1 representa um administrator
  state: "RJ",
  cep: "20000000",
  street: "Rua",
  number: 1,
  password: "Admin@123",
  password_confirmation: "Admin@123",
}

user = User.create(Administrator_params)


# Criar um usuário com role 3 (Client)
client_params = {
  name: "Admin User",
  cpf: "16489301744",
  email: "client@example.com",
  role: 3,  # Role 3 representa um Client
  state: "RJ",
  cep: "20000000",
  street: "Rua",
  number: 1,
  password: "Admin@123",
  password_confirmation: "Admin@123",
}

user = User.create(client_params)
