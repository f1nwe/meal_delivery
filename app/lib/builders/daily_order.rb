# frozen_string_literal: true

module Builders
  class DailyOrder
    class << self
      def build_new
        ::DailyOrder.new(date: Time.zone.today)
      end

      def build_from(params = {})
        daily_menu = ::DailyOrder.new(params)

        daily_menu.date = Time.zone.today

        daily_menu
      end
    end
  end
end
