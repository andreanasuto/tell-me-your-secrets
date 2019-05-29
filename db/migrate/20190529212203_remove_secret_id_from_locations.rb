class RemoveSecretIdFromLocations < ActiveRecord::Migration[5.1]
  def change
    remove_column :locations, :secret_id, :integer
  end
end
