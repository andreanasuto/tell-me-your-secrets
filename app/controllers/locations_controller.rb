class LocationsController < ApplicationController
  include ApplicationHelper
  include LocationsHelper

  def index
    @locations = Location.all
    @locations_name = Location.locations_name
  end

  def northernmost
    @location = Location.northernmost_secret
  end

  def southernmost
    @location = Location.southernmost_secret
  end

  def show
    @location = Location.find_location_by_city_or_address(params) || Location.find(params[:id]) #find the location based on params[:location_id]
    unless current_user.check_near_locations(params) #check if the user has shared secret in the location and returns them
      @locations = Location.close_locations_near_to_a_slug(params) #find all locations near a params[:id]
    end

    respond_to do |f|
      f.html
      f.json {render json: @location, status: 201}
    end
  end

end
