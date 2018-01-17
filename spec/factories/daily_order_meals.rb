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

FactoryBot.define do
  factory :daily_order_meal do
    association :meal, factory: :meal
    association :daily_order, factory: :daily_order
  end
end
