Rails.application.routes.draw do

  mount_devise_token_auth_for 'User', at: 'auth'
  # Defina suas rotas personalizadas depois
  resources :comments, only: [:index, :show]
  resources :users, only: [:index, :show, :create, :update]
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
