module SecretsHelper

  def insert_a_new_secret_option(secret, location)
    if !params[:user_id]
      render partial: 'form', locals: {secret: secret, location: location }
    end
  end

  def are_secrets_nested?(secrets)
    if params[:location_id]
      location = Location.find(params[:location_id])
      render partial: 'secret_location_nested', locals: {secrets: secrets, location: location}
    else
      render @secrets
    end
  end
end
