# frozen_string_literal: true

module Account
  class DashboardController < BaseController
    def calendar
      @daily_orders         = collection
      @available_menu_dates = available_menu_dates
    end

    private

    def collection
      current_user.daily_orders.in_month(start_date).ordered
    end

    def available_menu_dates
      Menu.in_month(start_date).ordered.pluck(:date)
    end

    def start_date
      Date.parse(params[:start_date])
    rescue ArgumentError, TypeError
      Time.zone.today
    end
  end
end
