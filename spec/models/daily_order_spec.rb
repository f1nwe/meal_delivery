# frozen_string_literal: true

# == Schema Information
#
# Table name: daily_orders
#
#  id                  :integer          not null, primary key
#  user_id             :integer
#  date                :date
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  menu_id             :integer
#  total_cost_kopiykas :integer          default(0)
#

require 'rails_helper'

RSpec.describe DailyOrder, type: :model do
  include_examples 'valid_factories', :daily_order

  describe '#calculate_total_cost' do
    let(:menu)          { create(:menu) }
    let(:meals)         { create_list(:meal, 2, menu: menu) }
    let(:daily_order)   { build(:daily_order, menu: menu, meals: meals) }

    it 'calculates total cost on save' do
      expect(daily_order).to receive(:calculate_total_cost)

      daily_order.save
    end

    it 'calculates correct total_cost' do
      daily_order.save

      expect(daily_order.reload.total_cost).to eq(meals.sum(&:price))
    end
  end
end
