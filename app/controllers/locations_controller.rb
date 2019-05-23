class LocationsController < ApplicationController
  include ApplicationHelper
  include LocationsHelper

  def index
    @locations = Location.all
    @locations_name = locations_name

  end

  def northest
    @location = Location.northest_secret
  end

  def southest
    @location = Location.southest_secret
  end

  def show
    @location = find_location #find the location based on params[:location_id]
    unless check_near_locations #check if the user has shared secret in the location and returns them
      @locations = close_locations_near_to_a_slug #find all locations near a params[:id]
    end
  end



end
