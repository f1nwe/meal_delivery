class CreateMealCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :meal_categories do |t|
      t.string :title

      t.timestamps
    end
  end
end
