class CreateMeals < ActiveRecord::Migration[5.1]
  def change
    create_table :meals do |t|
      t.string :type, index: true, null: false
      t.string :name
      t.string :photo
      t.references :menu, index: true
      t.integer :price_kopiykas, default: 0, null: false

      t.timestamps
    end
  end
end
