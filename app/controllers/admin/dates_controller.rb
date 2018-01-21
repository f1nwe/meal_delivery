# frozen_string_literal: true

module Admin
  class DatesController < BaseController
    include DateParser

    def index; end

    def show
      @user_orders = collection.where(date: date).page(params[:page]).per(15)
    end

    private

    def collection
      DailyOrder.in_month(date).ordered
    end
  end
end
