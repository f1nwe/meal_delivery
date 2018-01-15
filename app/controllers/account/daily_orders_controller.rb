# frozen_string_literal: true

module Account
  class DailyOrdersController < BaseController
    def show
      @daily_order = resource
    end

    def new
      @daily_order = DailyOrder.new
    end

    def create
      @daily_order      = DailyOrder.new(resource_params)
      @daily_order.date = Time.zone.now

      if @daily_order.save
        redirect_to account_daily_order_path(@daily_order)
      else
        render :new
      end
    end

    private

    def resource_params
      params.require(:daily_order)
    end

    def collection
      DailyOrder.ordered
    end

    def resource
      collection.find(params[:id])
    end
  end
end
