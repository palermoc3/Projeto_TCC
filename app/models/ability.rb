# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # convidado (não logado)

    case user.role
    when 1
      can [:update], User, id: user.id
    when 2
      can :read, :all
      # Adicione mais habilidades para funcionários, se necessário
    when 3
      # Habilidades para clientes
    end
  end
end
