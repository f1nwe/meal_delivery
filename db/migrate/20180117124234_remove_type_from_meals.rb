class RemoveTypeFromMeals < ActiveRecord::Migration[5.1]
  def change
    remove_column :meals, :type, :string
  end
end
