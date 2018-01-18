# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Validators::MealMenuInclusion do
  describe '#validate' do
    let(:user)        { create(:user) }
    let(:menu1)       { create(:menu) }
    let(:menu2)       { create(:menu) }
    let(:meal1)       { create(:meal, menu: menu1) }
    let(:meal2)       { create(:meal, menu: menu2) }
    let(:daily_order) { create(:daily_order, user: user, menu: menu1) }

    it 'valid if ordered meals from appropriate menu' do
      daily_order_meal = build(:daily_order_meal, daily_order: daily_order, meal: meal1)
      expect(daily_order_meal).to be_valid
    end

    it 'invalid if ordered meals from not order menu' do
      daily_order_meal = build(:daily_order_meal, daily_order: daily_order, meal: meal2)
      error_message    = Validators::MealMenuInclusion::ERROR_MESSAGE

      expect(daily_order_meal).not_to be_valid
      expect(daily_order_meal.errors[:meal_id]).to include(error_message)
    end
  end
end
