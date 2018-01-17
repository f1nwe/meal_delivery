# frozen_string_literal: true

module Presenters
  class Menu < SimpleDelegator
    def meals_per_categories
      @meals_per_categories ||= meals.includes(:meal_category).group_by do |meal|
        meal.meal_category.title
      end.to_h
    end
  end
end
