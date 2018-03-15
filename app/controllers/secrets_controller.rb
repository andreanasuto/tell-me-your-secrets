class SecretsController < ApplicationController

  def new
    @secret = Secret.new
    
  end

  def create
    @secret = Secret.create(sentence: params[:secret][:sentence], latitude: request.location.latitude, longitude: request.location.longitude)
    redirect_to secret_path(@secret)
  end

  def show
    @secret = Secret.find(params[:id])
  end


end
