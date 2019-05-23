class AddAttributesToLocations < ActiveRecord::Migration[5.1]
  def change
    add_column :locations, :house_number, :integer
    add_column :locations, :road, :string
    add_column :locations, :city, :string
    add_column :locations, :county, :string
    add_column :locations, :city_district, :string
    add_column :locations, :suburb, :string
    add_column :locations, :state, :string
    add_column :locations, :country, :string
    add_column :locations, :zipcode, :string
  end
end
