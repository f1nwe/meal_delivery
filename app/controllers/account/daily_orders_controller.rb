# frozen_string_literal: true

module Account
  class DailyOrdersController < BaseController
    def show
      @daily_order = resource
    end

    def new
      @daily_menu  = daily_menu
      @daily_order = DailyOrder.new
    end

    def create
      @daily_menu  = daily_menu
      @daily_order = Builders::DailyOrder.build_from(resource_params)

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

    def daily_menu
      Menu.find_by!(date: Time.zone.today)
    end
  end
end
