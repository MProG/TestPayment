Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'omniauth_callbacks'
  }
  
  resources :charges, only: [:create]
  resources :products

  root 'products#index'
end
