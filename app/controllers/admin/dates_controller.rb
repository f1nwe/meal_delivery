# frozen_string_literal: true

module Admin
  class DatesController < BaseController
    def index; end

    def show
      @user_orders = collection.page(params[:page]).per(15)
    end

    private

    def collection
      DailyOrder.in_month(Date.parse(params[:date])).ordered
    end
  end
end
