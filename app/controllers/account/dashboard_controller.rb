# frozen_string_literal: true

module Account
  class DashboardController < BaseController
    def calendar
      @daily_orders = collection
    end

    private

    def collection
      current_user.daily_orders.in_month(start_date).ordered
    end

    def start_date
      Date.parse(params[:start_date])
    rescue ArgumentError, TypeError
      Time.zone.today
    end
  end
end
