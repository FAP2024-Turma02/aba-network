Rails.application.routes.draw do
  
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :posts do
    resources :comments, only: [:show, :index, :create, :update]
  end
  resources :comments do
    resources :comments, only: [:show, :index, :create, :update]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # 
  # get 'users', to: 'users#index'
end
