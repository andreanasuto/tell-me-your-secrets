class RemoveLocationIdAndUserIdFromSecrets < ActiveRecord::Migration[5.1]
  def change
    remove_column :secrets, :location_id, :integer
    remove_column :secrets, :user_id, :integer
  end
end
