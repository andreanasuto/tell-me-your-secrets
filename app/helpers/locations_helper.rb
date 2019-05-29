module LocationsHelper

  def has_access_to_locations?
    if @locations
      render @locations
    elsif @location
      render partial: 'locations/city'
    end
  end
end
