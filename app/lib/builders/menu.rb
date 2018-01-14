# frozen_string_literal: true

module Builders
  class Menu
    class << self
      def build
        menu = ::Menu.new(date: Date.current)

        menu.drinks.new
        menu.first_courses.new
        menu.main_courses.new

        menu
      end
    end
  end
end
