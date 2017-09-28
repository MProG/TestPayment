Rails.application.routes.draw do
  root 'products#index'
  devise_for :users, controllers: {
    omniauth_callbacks: 'omniauth_callbacks'
  }
  
  resources :charges, only: [:new, :create]
  resources :products
end
