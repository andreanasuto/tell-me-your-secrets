class RemovePostcodeFromLocations < ActiveRecord::Migration[5.1]
  def change
    remove_column :locations, :postcode, :string
  end
end
