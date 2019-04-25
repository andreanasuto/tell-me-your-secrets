Rails.application.routes.draw do

  resources :users do
    resources :secrets
    # POST /users/:id/secrets - a secret belongs to a user!
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end


end
