# frozen_string_literal: true

module Account
  class DatesController < BaseController
    include DateParser

    def index
      @daily_menu = Menu.find_by(date: Time.zone.today)
    end

    def show
      @date        = date
      @menu        = Menu.find_by(date: @date)
      @daily_order = current_user.daily_orders.find_by(date: @date)
    end
  end
end
