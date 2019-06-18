module SecretsHelper

  def insert_a_new_secret_option(secret, location)
    if !params[:user_id]
      render partial: 'form', locals: {secret: secret, location: location }
    end
  end
end
