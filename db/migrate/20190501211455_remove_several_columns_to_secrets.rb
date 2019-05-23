class RemoveSeveralColumnsToSecrets < ActiveRecord::Migration[5.1]
  def change
    remove_column :secrets, :latitude, :float
    remove_column :secrets, :longitude, :float
    remove_column :secrets, :ip_address, :string
    remove_column :secrets, :address, :string
  end
end
