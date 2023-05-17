# frozen_string_literal: true

Rails.application.routes.draw do 
  resources :chefs, param: :chef_id do 
    member do
      resource :address, only: %i[show]          
      resource :city, only: %i[show]               
      resource :state, only: %i[show]            
      resources :telephones, only: %i[index]     
      resources :dishes, only: %i[index]         
    end
  end
  
  resources :states do
    member do
      resources :cities, only: %i[index]           
    end
  end

  resources :coupons do
    member do
      resources :orders, only: %i[index]
    end
  end

  resources :dishes, param: :dish_id do
    member do
      resources :categories, only: %i[index]
    end
  end

  resources :categories, only: %i[index]

  resources :payments, param: :payment_id do
    member do
      resource :customer, only: %i[show]
    end
  end

  resources :customers, param: :customer_id do
    member do
      resources :orders, only: %i[index]
      resources :addresses, only: %i[show]
      resources :telephones, only: %i[index]
      resources :cards, only: %i[show]
    end
  end

  resources :orders, param: :order_id do
    member do 
      resources :order_items, only: %i[index show]
      resources :dishes, only: %i[index show]
      resource :city, only: %i[show]
      resource :payment, only: %i[show]
    end
  end
end