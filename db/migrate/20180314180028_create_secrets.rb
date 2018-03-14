class CreateSecrets < ActiveRecord::Migration[5.1]
  def change
    create_table :secrets do |t|
      t.text :sentence
      t.timestamps
    end
  end
end
