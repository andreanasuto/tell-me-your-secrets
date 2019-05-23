module ApplicationHelper
  def is_location_nested?
    params[:location_id]
  end

  def display_location_secrets?
    if check_location
      @location = Location.find(params[:location_id])
      @secrets = @location.secrets
    else
      redirect_to new_secret_path, alert: "You don't have access to this location, you have been redirected"
    end
  end

  def is_user_nested?
    params[:user_id]
  end

  def check_location
    if params[:id] || params[:location_id]
      current_user.locations.include?(Location.find(params[:location_id]))
    end
  end

  def check_user
    if params[:id] || params[:user_id]
      User.find(params[:id] || params[:user_id]) == current_user
    end
  end

  def display_user_secrets?
    if check_user
      user = User.find(params[:user_id])
      @secrets = user.secrets
    else
      redirect_to new_secret_path, alert: "You don't have access to this user, you have been redirected"
    end
  end

  def display_secrets
    @secrets = current_user.close_secrets.flatten.uniq
  end

  def check_user_secret
    if @secret.user != current_user
      redirect_to secrets_path
    end
  end

  def have_access_to_secrets?(secret)
    if @secrets == current_user.secrets
      render partial: 'secrets/links', locals: {secret: secret}
    end
  end
end
