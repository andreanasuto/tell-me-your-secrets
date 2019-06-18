class AddSecretIdToLocations < ActiveRecord::Migration[5.1]
  def change
    add_column :locations, :secret_id, :integer
  end
end
