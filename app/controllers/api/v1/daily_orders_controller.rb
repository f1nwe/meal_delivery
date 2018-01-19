# frozen_string_literal: true

module Api
  module V1
    class DailyOrdersController < BaseController
      def index
        @daily_orders = collection
      end

      private

      def collection
        DailyOrder.ordered.where(date: Time.zone.today)
                  .includes(:user, :meals)
      end
    end
  end
end
