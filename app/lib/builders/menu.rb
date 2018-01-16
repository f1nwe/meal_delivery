# frozen_string_literal: true

module Builders
  class Menu
    class << self
      def build_new
        menu = ::Menu.new(date: Time.zone.today)

        menu.drinks.new
        menu.first_courses.new
        menu.main_courses.new

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
