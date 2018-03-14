class AddLatitudeAndLongitudeToModel < ActiveRecord::Migration[5.1]
  def change
    add_column :secrets, :latitude, :float
    add_column :secrets, :longitude, :float
  end
end
