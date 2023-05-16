# frozen_string_literal: true

Rails.application.routes.draw do 
  resources :chefs, only: %i[show index] do 
    member do
      resource :address, only: %i[show]       # '/chefs/:chef_id/address'
      resource :city, only: %i[show]          # '/chefs/:chef_id/city'  
      resource :state, only: %i[show]         # '/chefs/:chef_id/state'
      resources :telephones, only: %i[index]  # '/chefs/:chef_id/telephones'
      resources :dishes, only: %i[index]      # '/chefs/:chef_id/dishes'
    end
  end
end
