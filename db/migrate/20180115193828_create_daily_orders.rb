class CreateDailyOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :daily_orders do |t|
      t.references :user, foreign_key: true
      t.date :date, index: true

      t.timestamps
    end
  end
end
