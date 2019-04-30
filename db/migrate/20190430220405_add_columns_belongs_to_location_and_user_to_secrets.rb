class AddColumnsBelongsToLocationAndUserToSecrets < ActiveRecord::Migration[5.1]
  def change
    add_reference :secrets, :user, foreign_key: true
    add_reference :secrets, :location, foreign_key: true
  end
end
