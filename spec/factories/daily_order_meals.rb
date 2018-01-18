# frozen_string_literal: true

# == Schema Information
#
# Table name: daily_order_meals
#
#  id               :integer          not null, primary key
#  daily_order_id   :integer
#  meal_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  meal_category_id :integer
#

FactoryBot.define do
  factory :daily_order_meal do
    before :create do |daily_order_meal|
      menu        = FactoryBot.create(:menu)
      meal        = FactoryBot.create(:meal, menu: menu)
      daily_order = FactoryBot.create(:daily_order, menu: menu)

      daily_order_meal.meal        = meal
      daily_order_meal.daily_order = daily_order
    end
  end
end
