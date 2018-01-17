# frozen_string_literal: true

# == Schema Information
#
# Table name: meals
#
#  id               :integer          not null, primary key
#  name             :string
#  photo            :string
#  menu_id          :integer
#  price_kopiykas   :integer          default(0), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  meal_category_id :integer
#

require 'rails_helper'

RSpec.describe Meal, type: :model do
  include_examples 'valid_factories', :meal

  describe 'associations' do
    it { should belong_to(:menu) }
  end

  describe 'update_total_cost_for_orders' do
    let(:meal) { create(:meal) }

    it 'updates when price changed' do
      expect(meal).to receive(:update_total_cost_for_orders)
      meal.update(price: rand(10..100))
    end

    it 'updates on save changed' do
      meal = build(:meal)
      expect(meal).to receive(:update_total_cost_for_orders)
      meal.save
    end

    it 'does not update when price has not changed' do
      expect(meal).not_to receive(:update_total_cost_for_orders)
      meal.update(name: Faker::Lorem.word)
    end
  end
end
