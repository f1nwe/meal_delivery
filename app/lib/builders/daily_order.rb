# frozen_string_literal: true

module Builders
  class DailyOrder
    attr_reader :menu, :date, :default_params, :user

    def initialize(menu, user)
      @menu           = menu
      @user           = user
      @default_params = {
        date: menu.date,
        user: @user
      }
    end

    def build_new
      menu.daily_orders.new(default_params)
    end

    def build_from(params = {})
      menu.daily_orders.new(params.merge(default_params))
    end
  end
end
