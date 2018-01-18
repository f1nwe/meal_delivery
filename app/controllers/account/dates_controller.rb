# frozen_string_literal: true

module Account
  class DatesController < BaseController
    def index; end

    def show
      @date        = date
      @menu        = Menu.find_by(date: @date)
      @daily_order = current_user.daily_orders.find_by(date: @date)
    end

    private

    def date
      Date.parse(params[:date])
    rescue ArgumentError, TypeError
      not_found
    end
  end
end
