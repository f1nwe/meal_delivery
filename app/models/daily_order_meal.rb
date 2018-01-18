# frozen_string_literal: true

# == Schema Information
#
# Table name: daily_order_meals
#
#  id             :integer          not null, primary key
#  daily_order_id :integer
#  meal_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class DailyOrderMeal < ApplicationRecord
  include ActiveModel::Validations

  belongs_to :daily_order
  belongs_to :meal

  validates_with Validators::MealMenuInclusion
end
