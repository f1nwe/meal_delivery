class AddMenuReferenceToDailyOrder < ActiveRecord::Migration[5.1]
  def change
    add_reference :daily_orders, :menu, foreign_key: true
  end
end
