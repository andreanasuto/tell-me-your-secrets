class SecretsController < ApplicationController
include ApplicationHelper
before_action :authentification_required

  def new
    @secret = Secret.new
    if params[:location_id]
      @secret.location = Location.find(params[:location_id])
    else
      @location = @secret.build_location
    end
  end

  def create
    #if eg. locations/1/secrets/new
    if params[:location_id]
      @location = Location.find(params[:location_id])
      @secret = @location.secrets.build(secret_params)
      @secret.user = current_user
    else
      @location = Location.find_or_create_by(
        :latitude => params[:secret][:location][:latitude].to_f.round(4),
        :longitude => params[:secret][:location][:longitude].to_f.round(4))
      @secret = @location.secrets.build(secret_params)
      @secret.user = current_user
    end

    if @secret.save
      redirect_to secrets_path
    else
      render :new
    end
  end

  def show
    @secret = Secret.find(params[:id])
    if @secret.check_user_secret(current_user)
    else
      redirect_to new_secret_path, alert: "You don't have access to this secret, you have been redirected"
    end
  end

  def index
    # e.g. /locations/:location_id/secrets
    if params[:location_id]
      location = Location.find(params[:location_id])
      if current_user.locations.include?(location) #check if user has access to that location_id because he/she shared a secret there
        @secrets = location.secrets
      else
        redirect_to new_secret_path, alert: "You don't have access to this location, you have been redirected"
      end


    # e.g. /users/:user_id/secrets
    elsif params[:user_id] #is_user_nested? & #check if user has access to that user_id because he's the owner of that profile
        user = User.find(params[:user_id])
        if user == current_user
          @secrets = current_user.secrets
        else
          redirect_to new_secret_path, alert: "You don't have access to this user, you have been redirected"
        end

    #e.g /secrets
    else
      @secrets = current_user.display_secrets # display other people secrets close to the locations of the secrets shared by the user
    end
  end

  def edit
    @secret = Secret.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def likes
    #it finds the secret that should be liked
    #it increases the secret.likes by 1
    @secret = Secret.find(params[:secret_id])
    @secret.likes += 1
    @secret.save
    redirect_to secrets_path
  end

  def update
    @user = User.find(session[:user_id])
    @secret = Secret.find(params[:id])
    @secret.update(secret_params)
    redirect_to user_secrets_path(@user)
  end

  def destroy
    @secret = Secret.find(params[:id])
    @secret.destroy
    redirect_to new_secret_path
  end

  private

  def secret_params
    params.require(:secret).permit(:sentence)
  end


end
