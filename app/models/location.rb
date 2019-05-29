class Location < ApplicationRecord
  has_many :secrets
  has_many :users, through: :secrets
  accepts_nested_attributes_for :secrets

  validates :latitude, presence: true
  validates :longitude, presence: true
  after_validation :reverse_geocode

  scope :northernmost_secret, -> {Location.joins(:secrets).group('secret_id').order('max(latitude) DESC').first }
  scope :southernmost_secret, -> {Location.joins(:secrets).group('secret_id').order('min(latitude) DESC').first }

  reverse_geocoded_by :latitude, :longitude do |obj,results|
  if geo = results.first
    obj.address = geo.data['display_name']
    obj.house_number = geo.data["address"]["house_number"]
    obj.road = geo.data["address"]["road"]
    obj.city = geo.data["address"]["city"]
    obj.county = geo.data["address"]["county"]
    obj.city_district = geo.data["address"]["city_district"]
    obj.suburb = geo.data["address"]["suburb"]
    obj.state = geo.data["address"]["state"]
    obj.zipcode = geo.data["address"]["postcode"]
    obj.country = geo.data["address"]["country"]
  end
end

  def self.locations_name
    self.all.collect { |l|
      unless l.city.nil?
        l.city
      else
        l.address
      end
    }.uniq
  end

  def self.find_location_by_city_or_address(params)
    Location.all.find_by(city: params[:id]) || Location.all.find_by(address: params[:id])
  end

  def self.close_locations_near_to_a_slug
    Location.all.near(params[:id])
  end

end
