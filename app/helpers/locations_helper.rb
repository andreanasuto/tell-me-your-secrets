module LocationsHelper
  #def setup_location(location)
  #  location.secrets << Secret.new
  #  location
  #end
  def locations_name
    Location.all.collect { |l|
      unless l.city.nil?
        l.city
      else
        l.address
      end
    }.uniq
  end

  def find_location
    Location.all.find_by(city: params[:id]) || Location.all.find_by(address: params[:id])
  end

  def check_near_locations
    current_user.locations.near(params[:id]).empty?
  end

  def close_locations_near_to_a_slug
    Location.all.near(params[:id])
  end

  def has_access_to_locations?
    if @locations
      render @locations
    elsif @location
      render partial: 'locations/city'
    end
  end
end
