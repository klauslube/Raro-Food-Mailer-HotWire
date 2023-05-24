# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root to: 'devise/sessions#new'
  end

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

  resources :categories

  resources :payments

  resources :customers

  resources :orders

  resources :order_items
end
