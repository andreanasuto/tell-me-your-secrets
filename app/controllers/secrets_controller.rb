class SecretsController < ApplicationController

  def new
    @secret = Secret.new
  end

  def create
    @secret = Secret.new(
              sentence: params[:secret][:sentence]
              # latitude: request.location.latitude,
              # longitude: request.location.longitude
              )
    @secret.location = Location.where(
      :latitude => params[:secret][:latitude],
      :longitude => params[:secret][:longitude]).first_or_create
    @secret.save

    # list of attributes for location:
    # "ip"=>"127.0.0.1",
    # "city"=>"",
    # "region_code"=>"",
    # "region_name"=>"",
    # "metrocode"=>"",
    # "zipcode"=>"",
    # "latitude"=>"0",
    # "longitude"=>"0",
    # "country_name"=>"Reserved",
    # "country_code"=>"RD"}

    redirect_to secret_path(@secret)
  end

  def show
    @secret = Secret.find(params[:id])
  end


end
