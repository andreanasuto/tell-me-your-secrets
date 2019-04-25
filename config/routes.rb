Rails.application.routes.draw do

  resources :users do
    resources :secrets
<<<<<<< HEAD
    # POST /users/:id/secrets - a secret belongs to a user!
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end

=======
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end

  # POST /users/:id/secrets - a secret belongs to a user!
>>>>>>> 9a783669ddcb2baf2ff18a0e5c14490489ba43ba

end
