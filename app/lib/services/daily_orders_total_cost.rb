# frozen_string_literal: true

module Services
  class DailyOrdersTotalCost
    attr_reader :daily_orders

    def initialize(daily_orders)
      @daily_orders = daily_orders
    end

    def calculate!
      daily_orders.each(&:calculate_total_cost)
    end
  end
end
