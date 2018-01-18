# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Services::DailyOrdersTotalCost do
  describe '#calculate!' do
    let(:menu)         { create(:menu) }
    let(:meal)         { create(:meal, menu: menu) }
    let(:daily_orders) { create_list(:daily_order, 2, menu: menu, meals: [meal]) }

    it 'runs calcula tion on each order that includes meal' do
      daily_orders.each do |daily_order|
        expect(daily_order).to receive(:calculate_total_cost)
      end

      Services::DailyOrdersTotalCost.new(daily_orders).calculate!
    end
  end
end
