class AddIndexOnDateToMenu < ActiveRecord::Migration[5.1]
  def change
    add_index :menus, :date
  end
end
