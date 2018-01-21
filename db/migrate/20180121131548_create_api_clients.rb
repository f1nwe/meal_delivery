class CreateApiClients < ActiveRecord::Migration[5.1]
  def change
    create_table :api_clients do |t|
      t.string :access_token, index: { unique: true }
      t.string :name,         index: { unique: true }

      t.timestamps
    end
  end
end
