# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # convidado (não logado)

    if user.present? && user.role == 1
      can :manage, :all
    else
      # Habilidades para usuários padrão (se necessário)
    end
  end
end
