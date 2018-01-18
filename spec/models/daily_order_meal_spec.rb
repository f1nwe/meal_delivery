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

require 'rails_helper'

RSpec.describe DailyOrderMeal, type: :model do
  include_examples 'valid_factories', :daily_order_meal
end
