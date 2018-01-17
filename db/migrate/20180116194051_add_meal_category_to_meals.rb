class AddMealCategoryToMeals < ActiveRecord::Migration[5.1]
  def change
    add_reference :meals, :meal_category, foreign_key: true
  end
end
