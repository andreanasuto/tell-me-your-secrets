class SecretsController < ApplicationController

  def new
    @secret = Secret.new
    
  end

  def create
    @secret = Secret.create(sentence: params[:secret][:sentence])
    city = request.location.city
    country = request.location.country_code
    binding.pry
    redirect_to secret_path(@secret)
  end

  def show
    @secret = Secret.find(params[:id])
  end


end
