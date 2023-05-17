# frozen_string_literal: true

Rails.application.routes.draw do 
  resources :chefs, param: :chef_id do 
    member do
      resource :address, only: %i[show]                # '/chefs/:chef_id/address'
      resource :city, only: %i[show]                   # '/chefs/:chef_id/city'  
      resource :state, only: %i[show]                  # '/chefs/:chef_id/state'
      resources :telephones, only: %i[index]           # '/chefs/:chef_id/telephones'
      resources :dishes, only: %i[index]               # '/chefs/:chef_id/dishes'
    end
  end
  
  resources :states do
    member do
      resources :cities, only: %i[index]            # '/states/:state_id/cities
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
end
