class AddColumnToSecrets < ActiveRecord::Migration[5.1]
  def change
    add_column :secrets, :address, :string
  end
end
