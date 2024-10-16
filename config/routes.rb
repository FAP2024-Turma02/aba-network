Rails.application.routes.draw do
  resources :comments, only: [:show, :index]

  mount_devise_token_auth_for 'User', at: 'auth'

  resources :posts do
    resources :attachments, only: [:index, :show]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # 
  # get 'users', to: 'users#index'
end
