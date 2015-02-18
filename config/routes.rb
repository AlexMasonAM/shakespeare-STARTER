Rails.application.routes.draw do

  root to: 'home#index'

  get '/login' => 'sessions#new', as: :login
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy', as: :logout
  get '/signup' => 'users#new', as: :signup
  
  resources :users do
    resources :books do
      resources :reviews
    end
  end

  resources :books do
    resources :reviews
  end

  resources :reviews
end
