# frozen_string_literal: true

module Admin
  class MenusController < BaseController
    def index
      @menus = collection
    end

    def show
      @menu = resource
    end

    def new
      @menu = Builders::Menu.build_new
    end

    def create
      @menu = Builders::Menu.build_from(resource_params)

      if @menu.save
        redirect_to [:admin, @menu]
      else
        render :new
      end
    end

    def edit
      @menu = resource
    end

    def update
      @menu = resource

      if @menu.update(resource_params)
        redirect_to [:admin, @menu]
      else
        render :edit
      end
    end

    private

    def resource_params
      allowed_params = [
        meals_attributes: %i[id meal_category_id name photo price _destroy]
      ]

      params.require(:menu).permit(allowed_params)
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
