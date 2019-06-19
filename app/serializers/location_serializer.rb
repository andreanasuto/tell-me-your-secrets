class LocationSerializer < ActiveModel::Serializer
  attributes :id, :latitude, :longitude, :address, :house_number, :road, :city, :county, :city_district, :suburb, :state, :country, :zipcode
end
