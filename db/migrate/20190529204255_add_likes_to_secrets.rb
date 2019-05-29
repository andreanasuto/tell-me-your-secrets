class AddLikesToSecrets < ActiveRecord::Migration[5.1]
  def change
    add_column :secrets, :likes, :integer, :default => 0
  end
end
