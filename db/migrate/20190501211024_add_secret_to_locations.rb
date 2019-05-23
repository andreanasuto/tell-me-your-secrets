class AddSecretToLocations < ActiveRecord::Migration[5.1]
  def change
    add_reference :locations, :secret, foreign_key: true
  end
end
