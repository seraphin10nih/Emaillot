Rails.application.routes.draw do
  devise_for :users
  resources :orders
  resources :line_items
  resources :carts
  root 'home#index'
  resources :maillots
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
