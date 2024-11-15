Rails.application.routes.draw do
  root to: proc { [200, { 'Content-Type' => 'application/json' }, [{ message: 'API está ativa' }.to_json]] }
  
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :companies, except: :destroy
  resources :domains
  resources :posts, only: [:index, :show, :create, :update, :destroy]
  resources :users, except: :destroy
  
  resources :posts do
    resources :comments, only: [:show, :index, :create, :update, :destroy]
  end
  resources :comments do
    resources :comments, only: [:show, :index, :create, :update, :destroy]
  end
end
