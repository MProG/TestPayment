Rails.application.routes.draw do
  devise_for :users
  root 'products#index'

  resources :charges, only: [:new, :create]
  resources :products
end
