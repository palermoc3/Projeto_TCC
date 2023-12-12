# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # convidado (não logado)

    if user.present? && user.role == 1
      can :manage, About
      can [:manage], Cellphone, user_id: user.id
      can [:manage], Employee
      can [:read], Cellphone
      can %i[update read], Store
      can %i[update read], Administrator
      can %i[read update], User
      can %i[read update], Purchase
      can %i[read update], ItemPurchase, user_id: user.id
      can [:read], ItemPurchase
      can %i[read update create], Payroll
      can %i[read update create], Product
      can %i[read update create], SubCategory
      can %i[read update create], Category
      # Habilidades para usuários padrão (se necessário)
    elsif user.present? && user.role == 2
      can %i[read create update], About
      can [:manage], Cellphone, user_id: user.id
      can  :read, Store
      can  :read, Administrator
      can %i[read update], User, user_id: user.id
      can %i[read], Employee, user_id: user.id
      can %i[read update create], Purchase, user_id: user.id
      can %i[read update], ItemPurchase, user_id: user.id
      can :read, Payroll, user_id: user.id
      can :read, Product
      can :read, SubCategory
      can :read, Category
    elsif user.present? && user.role == 3
      can [:manage], Cellphone, user_id: user.id
      can :read, About
      can  :read, Store
      can  :read, Administrator
      can [:manage], User, user_id: user.id
      can %i[read update create], Purchase, user_id: user.id
      can %i[read update], ItemPurchase, user_id: user.id
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
