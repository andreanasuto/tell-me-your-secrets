class AddSecretToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :secret, foreign_key: true
  end
end
