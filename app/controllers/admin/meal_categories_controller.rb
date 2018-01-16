# frozen_string_literal: true

module Admin
  class MealCategoriesController < BaseController
    def index
      @meal_categories = collection.page(params[:page]).per(15)
    end

    def new
      @meal_category = MealCategory.new
    end

    def create
      @meal_category = MealCategory.new(meal_category_params)

      if @meal_category.save
        flash[:success] = 'Category was successfully created'
        redirect_to admin_meal_categories_path
      else
        render :new
      end
    end

    def edit
      @meal_category = resource
    end

    def update
      @meal_category = resource

      if @meal_category.update(meal_category_params)
        flash[:success] = 'Category was successfully updated'
        redirect_to admin_meal_categories_path
      else
        render :edit
      end
    end

    def destroy
      @meal_category = resource
      @meal_category.destroy

      flash[:success] = 'Category was successfully deleted'

      redirect_to admin_meal_categories_path
    end

    private

    def meal_category_params
      params.require(:meal_category).permit(:title)
    end

    def collection
      MealCategory.ordered
    end

    def resource
      collection.find(params[:id])
    end
  end
end
