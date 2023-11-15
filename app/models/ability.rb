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
      can [:read, :update], User
      can [:read, :update], Purchase
      can [:read, :update], ItemPurchases , user_id: user.id
      can [:read], ItemPurchases
      can [:read, :update], Payroll
      can [:read, :update, :create], Product
      can [:read, :update, :create], SubCategory
      can [:read, :update, :create], Category
      # Habilidades para usuários padrão (se necessário)
    elsif user.present? && user.role == 2
      can [:read, :create, :update,], About
      can [:manage], Cellphone , user_id: user.id
      can  :read, Store
      can  :read, Administrator
      can [:read, :update], User , user_id: user.id
      can [:read, :update,:create], Purchase , user_id: user.id
      can [:read, :update], ItemPurchases , user_id: user.id
      can :read, Payroll , user_id: user.id
      can :read, Product
      can :read, SubCategory
      can :read, Category
    elsif user.present? && user.role == 3 
      can [:manage], Cellphone , user_id: user.id
      can :read, About
      can  :read, Store
      can  :read, Administrator
      can [:manage], User , user_id: user.id
      can [:read, :update, :create], Purchase , user_id: user.id
      can [:read, :update], ItemPurchases , user_id: user.id
      can :read, Product
      can :read, SubCategory
      can :read, Category
    else
      can :read, About
      can  :read, Store
      can  :read, Administrator
      can :read, Product
      can :read, SubCategory
      can :read, Category
    end
    
  end
end
