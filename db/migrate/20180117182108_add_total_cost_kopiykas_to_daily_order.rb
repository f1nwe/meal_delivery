class AddTotalCostKopiykasToDailyOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :daily_orders, :total_cost_kopiykas, :integer, default: 0
  end
end
