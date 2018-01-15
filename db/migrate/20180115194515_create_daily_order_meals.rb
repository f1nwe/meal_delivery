class CreateDailyOrderMeals < ActiveRecord::Migration[5.1]
  def change
    create_table :daily_order_meals do |t|
      t.references :daily_order, foreign_key: true
      t.references :meal, foreign_key: true

      t.timestamps
    end
  end
end
