class SecretsController < ApplicationController

  def new
    @secret = Secret.new
    
  end

  def create
    @secret = Secret.create(sentence: params[:secret][:sentence], 
                            latitude: request.location.latitude, 
                            longitude: request.location.longitude)
    binding.pry
    redirect_to secret_path(@secret)
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
  end

  def show
    @secret = Secret.find(params[:id])
  end


end
