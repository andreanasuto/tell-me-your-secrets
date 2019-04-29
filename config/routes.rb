Rails.application.routes.draw do
  # get '/patients/:id', to: 'patients#show', as: 'patient'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'

  resources :users do
    resources :secrets
    # POST /users/:id/secrets - a secret belongs to a user!
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end


end
