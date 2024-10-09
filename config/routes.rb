Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :domains, only: [:index, :show]
  # Defines the root path route ("/")
  # root "articles#index"
  # 
  # get 'users', to: 'users#index'
end
