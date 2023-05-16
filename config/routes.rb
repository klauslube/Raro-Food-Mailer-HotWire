# frozen_string_literal: true

Rails.application.routes.draw do 
  resources :chefs do 
    member do
      resource :address, only: %i[show]       # '/chefs/:chef_id/address'
      resource :city, only: %i[show], to: 'cities#show_chef_city'          # '/chefs/:chef_id/city'  
      resource :state, only: %i[show], to: 'states#show_chef_state'         # '/chefs/:chef_id/state'
      resources :telephones, only: %i[index]  # '/chefs/:chef_id/telephones'
      resources :dishes, only: %i[index]      # '/chefs/:chef_id/dishes'
    end
  end
  
  resources :states do
    member do
      resources :cities, only: %i[index]      # '/states/:state_id/cities
    end
  end
end
