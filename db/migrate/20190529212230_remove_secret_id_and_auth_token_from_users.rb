class RemoveSecretIdAndAuthTokenFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :secret_id, :integer
    remove_column :users, :auth_token, :string
  end
end
