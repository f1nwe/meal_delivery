# frozen_string_literal: true

module Builders
  class Menu
    class << self
      def build_new
        menu = ::Menu.new(date: Time.zone.today)

        MealCategory.ordered.each do |meal_category|
          menu.meals.new(meal_category: meal_category)
        end

        menu
      end

      def build_from(params = {})
        menu = ::Menu.new(params)

        menu.date = Time.zone.today

        menu
      end
    end
  end
end
