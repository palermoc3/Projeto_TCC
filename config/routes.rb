# frozen_string_literal: true

Rails.application.routes.draw do
  resources :products
  resources :sub_categories
  resources :categories
  resources :onlines
  resources :item_purchases
  resources :purchases
  resources :abouts
  resources :stores
  resources :payrolls
  resources :cellphones
  resources :administrators
  resources :employees
  post 'aunthentication/login'
  post 'aunthentication/sign_up'
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
