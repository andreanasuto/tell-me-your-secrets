class SecretsController < ApplicationController
before_action :authentification_required

  def new
    @secret = Secret.new
    @location = @secret.build_location
  end

  def create
    @secret = Secret.new(sentence: params[:secret][:sentence])
    @secret.location = Location.where(
      :latitude => params[:secret][:location][:latitude],
      :longitude => params[:secret][:location][:longitude]).first_or_create
    @secret.user = current_user
    @secret.save
    redirect_to secret_path(@secret)
  end

  def show
    @secret = Secret.find(params[:id])
  end

  def index
    @secrets = Secret.all
  end

  def destroy
    @secret = Secret.find(params[:id])
    @secret.destroy
    redirect_to secrets_path
  end


end
