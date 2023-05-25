# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  resources :chefs, param: :chef_id

  resources :states do
    member do
      resources :cities, only: %i[index]
    end
  end

  # resources :coupons do
  #   member do
  #     resources :orders, only: %i[index]
  #   end
  # end

  resources :dishes

  resources :categories, only: %i[index]

  resources :payments

  resources :customers

  resources :orders
end
