Rails.application.routes.draw do

  devise_for :users, skip: [:sessions]
  as :user do
  get 'login', to: 'devise/sessions#new', as: :new_user_session
  post 'login', to: 'devise/sessions#create', as: :user_session
  delete 'logout', to: 'devise/sessions#destroy', as: :destroy_user_session
  end
  
 resources :stores, except: [:index,:destroy]
  
  root 'pages#index'
  get '/manager', to: 'managers#index'
  get '/orders', to: 'orders#index'
  get '/dashboard', to: 'dashboards#index'
  get '/returns', to: 'returns#index'
  get '/admin', to: 'admins#index'
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

