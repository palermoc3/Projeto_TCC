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
  number: '21980117423',
  
)

Cellphone.create!(
  user: administrator,
  kind: false,
  number: '2133322821',
  
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
