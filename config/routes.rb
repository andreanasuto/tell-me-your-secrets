Rails.application.routes.draw do
  # get '/patients/:id', to: 'patients#show', as: 'patient'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'

  get '/auth/google_oauth2', as: 'google_login'
  get '/auth/:provider/callback', to: 'sessions#create'

  resources :secrets, only: [:index, :new, :destroy, :create, :show]

  resources :users do
    resources :secrets, only: [:index, :show, :edit, :update]
  end

  get '/locations/northernmost', to: 'locations#northernmost'
  get '/locations/southernmost', to: 'locations#southernmost'

  resources :locations, only: [:show, :index] do
    resources :secrets, only: [:index, :show, :new]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
