# frozen_string_literal: true

module Admin
  class MenusController < BaseController
    before_action :init_menu, only: %i[show edit update]

    def index
      @menus = collection
    end

    def show; end

    def new
      @menu = collection.new
    end

    def create
      @menu = collection.new(menu_params)
    end

    def edit; end

    def update
      if @menu.update(menu_params)
        redirect_to [:admin, @menu]
      else
        render :edit
      end
    end

    private

    def menu_params
      params.require(:menu) # TODO
    end

    def init_menu
      @menu = resource
    end

    def collection
      date = params[:start_date] ? Date.parse(params[:start_date]) : Date.current
      Menu.ordered.where(date: date.beginning_of_month..date.end_of_month)
    end

    def resource
      collection.find(params[:id])
    end
  end
end
