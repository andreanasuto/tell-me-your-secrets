class AddColumnToSecret < ActiveRecord::Migration[5.1]
  def change
    add_column :secrets, :ip_address, :string
  end
end
