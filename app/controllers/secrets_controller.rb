class SecretsController < ApplicationController
include ApplicationHelper
before_action :authentification_required

  def new
    @secret = Secret.new
    if is_location_nested?
      @secret.location = Location.find(params[:location_id])
    else
      @location = @secret.build_location
    end
  end

  def create
    #if eg. locations/1/secrets/new
    if is_location_nested?
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
    check_user_secret
  end

  def index
    # e.g. /locations/:location_id/secrets
    if is_location_nested?
      display_location_secrets? #check if user has access to that location_id because he/she shared a secret there

    # e.g. /users/:user_id/secrets
    elsif is_user_nested?
        display_user_secrets? #check if user has access to that user_id because he's the owner of that profile

    #e.g /secrets
    else
      display_secrets # display other people secrets close to the locations of the secrets shared by the user
    end
  end

  def edit
    @secret = Secret.find(params[:id])
    @user = User.find(params[:user_id])
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
