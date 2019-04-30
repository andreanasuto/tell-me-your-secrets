Rails.application.routes.draw do
  # get '/patients/:id', to: 'patients#show', as: 'patient'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  get '/secrets/new', to: 'secrets#new'
  
  resources :secrets

  resources :users do
    resources :secrets, only: [:show, :index]
    # POST /users/:id/secrets - a secret belongs to a user!
  end

  resources :locations do
    resources :secrets, only: [:index]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
