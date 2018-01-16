# frozen_string_literal: true

module Admin
  class MenusController < BaseController
    before_action :init_menu, only: %i[show edit update]

    def index
      @menus = collection
    end

    def show; end

    def new
      @menu = Builders::Menu.build
    end

    def create
      @menu = Builders::Menu.build_from(resource_params)

      if @menu.save
        redirect_to [:admin, @menu]
      else
        render :new
      end
    end

    def edit; end

    def update
      if @menu.update(resource_params)
        redirect_to [:admin, @menu]
      else
        render :edit
      end
    end

    private

    def resource_params
      allowed_params = [
        drinks_attributes:        %i[id type name photo price _destroy],
        first_courses_attributes: %i[id type name photo price _destroy],
        main_courses_attributes:  %i[id type name photo price _destroy]
      ]

      params.require(:menu).permit(allowed_params)
    end

    def init_menu
      @menu = resource
    end

    def collection
      Menu.in_month(start_date).ordered
    end

    def resource
      collection.find(params[:id])
    end

    def start_date
      Date.parse(params[:start_date])
    rescue ArgumentError, TypeError
      Time.zone.today
    end
  end
end
