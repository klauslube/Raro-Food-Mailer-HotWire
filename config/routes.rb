# frozen_string_literal: true
require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'sessions'
  }
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

  resources :orders do
    collection do
      get "item_field"
    end
  end

  resources :order_items

  mount Sidekiq::Web => '/sidekiq'
end
