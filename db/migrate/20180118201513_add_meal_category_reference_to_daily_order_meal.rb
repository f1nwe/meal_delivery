class AddMealCategoryReferenceToDailyOrderMeal < ActiveRecord::Migration[5.1]
  def change
    add_reference :daily_order_meals, :meal_category, foreign_key: true
  end
end
