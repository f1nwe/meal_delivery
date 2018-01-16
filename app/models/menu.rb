# frozen_string_literal: true

# == Schema Information
#
# Table name: menus
#
#  id         :integer          not null, primary key
#  date       :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Menu < ApplicationRecord
  include MealHolder

  has_many_meals :meals
  has_many_meals :first_courses, class_name: 'Meals::FirstCourse'
  has_many_meals :main_courses, class_name: 'Meals::MainCourse'
  has_many_meals :drinks, class_name: 'Meals::Drink'

  scope :ordered,  -> { order(date: :asc) }
  scope :in_month, ->(date) { where(date: date.beginning_of_month..date.end_of_month) }

  validates :date, uniqueness: true, presence: true
end
