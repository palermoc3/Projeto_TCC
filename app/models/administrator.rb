class Administrator < User
  
    # Adicione aqui as validações específicas para o modelo Administrator, se necessário
    validates :cnpj, presence: true, numericality: { only_integer: true }, length: { is: 14 }, uniqueness: true
  end