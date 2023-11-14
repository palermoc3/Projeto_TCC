# frozen_string_literal: true

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

# Criação do celulares associado ao usuário
Cellphone.create!(
  user: administrator,
  kind: true,
  number: '21980117423'
)

Cellphone.create!(
  user: administrator,
  kind: false,
  number: '2133322821'
)

# Criação do administrador associado ao usuário
store = Administrator.create!(
  user: administrator,
  cnpj: '12345678901234'
)

about = Store.create!(
  administrator: store,
  kind: 1,
  payroll_day: 5,
  theme: 1
)

About.create!(
  store: about,
  about_text: 'palavras cruzadas são o maximo'
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

# Criar de Categorias
Category.create!(name: 'automotive')

Category.create!(name: 'toys')

# Criar de SubCategorias
cars = SubCategory.create!(name: 'Sport', category_id: 1)
SubCategory.create!(name: 'Economic', category_id: 1)
toys = SubCategory.create!(name: 'toys boys', category_id: 2)
SubCategory.create!(name: 'toys girl', category_id: 2)
SubCategory.create!(name: 'toys neutral', category_id: 2)

# Criar de Produtos
Product.create!(
  name: "Carrinho de Controle Remoto",
  weight: 0.5,
  width: 1.2,
  length: 0.6,
  depth: 0.2,
  quantity:20,
  valueSell: 49.99,
  valueBuy: 29.99,
  description: "Carrinho de brinquedo controlado remotamente.",
  sub_category_id: toys.id,
)

Product.create!(
  name: "uno",
  weight: 0.5,
  width: 1.2,
  length: 0.6,
  depth: 0.2,
  quantity: 20,
  valueSell: 500.99,
  valueBuy: 29.99,
  description: "Carro economico.",
  sub_category_id: cars.id,
)

Product.create!(
  name: "Civic",
  weight: 0.5,
  width: 1.2,
  length: 0.6,
  depth: 0.2,
  quantity: 20,
  valueSell: 1000.20,
  valueBuy: 29.99,
  description: "Carro um pouco menos economico.",
  sub_category_id: cars.id,
)