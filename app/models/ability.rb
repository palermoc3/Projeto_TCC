# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # convidado (não logado)

    if user.present? && user.role == 1
      can :manage, About
      can [:manage], Cellphone , user_id: user.id
      can [:read], Cellphone 
      can [:update, :read], Store
      can  [:update, :read], Administrator
      # Habilidades para usuários padrão (se necessário)
    elsif user.present? && user.role == 2
      can [:read, :create, :update,], About
      can [:manage], Cellphone , user_id: user.id
      can  :read, Store
      can  :read, Administrator
    elsif user.present? && user.role == 3 
      can [:manage], Cellphone , user_id: user.id
      can :read, About
      can  :read, Store
      can  :read, Administrator

    else
      can :read, About
      can  :read, Store
      can  :read, Administrator

    end
    
  end
end
