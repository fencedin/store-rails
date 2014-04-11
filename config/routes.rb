Amazan::Application.routes.draw do
  root to: "products#index"
  get 'new-admin', to: 'users#new', as: 'newadmin'
  get 'admin', to: 'sessions#new', as: 'admin'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  resources :users
  resources :sessions
  resources :products
end
