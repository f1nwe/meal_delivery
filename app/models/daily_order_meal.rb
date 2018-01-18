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

class DailyOrderMeal < ApplicationRecord
  include ActiveModel::Validations

  belongs_to :daily_order
  belongs_to :meal
  belongs_to :meal_category

  validates_with Validators::MealMenuInclusion
  validates :meal_id,          uniqueness: { scope: :daily_order_id }
  validates :meal_category_id, uniqueness: { scope: :daily_order_id }

  before_validation :set_meal_category

  private

  def set_meal_category
    self.meal_category = meal.meal_category
  end
end
