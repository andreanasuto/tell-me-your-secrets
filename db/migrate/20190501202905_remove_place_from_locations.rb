class RemovePlaceFromLocations < ActiveRecord::Migration[5.1]
  def change
    remove_column :locations, :place, :string
  end
end
