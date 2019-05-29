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
    @location = Location.find_location_by_city_or_address(params) #find the location based on params[:location_id]
    unless current_user.check_near_locations(params) #check if the user has shared secret in the location and returns them
      @locations = Location.close_locations_near_to_a_slug #find all locations near a params[:id]
    end
  end

end
