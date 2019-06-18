module LocationsHelper

  def has_access_to_locations?
    if @locations
      render @locations
    elsif @location
      render partial: 'locations/city'
    end
  end

  def has_access_to_location?(location)
    render partial: 'locations/location', locals: {location: location}
  end
end
