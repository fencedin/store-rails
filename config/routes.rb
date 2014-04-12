Amazan::Application.routes.draw do
  root to: "products#index"
  get 'new-admin', to: 'users#new', as: 'newadmin'
  get 'admin', to: 'sessions#new', as: 'admin'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'search', to: 'products#index'
  resources :users, only: [:new, :create, :edit, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :products
  resources :product_uploads, only: [:new, :create]
end
