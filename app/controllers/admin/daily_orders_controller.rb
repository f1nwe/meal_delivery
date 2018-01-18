# frozen_string_literal: true

module Admin
  class DailyOrdersController < BaseController
    def show
      @daily_order = resource
    end

    private

    def collection
      DailyOrder.ordered
    end

    def resource
      collection.find(params[:id])
    end
  end
end
