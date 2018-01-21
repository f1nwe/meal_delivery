# frozen_string_literal: true

# == Schema Information
#
# Table name: meal_categories
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MealCategory < ApplicationRecord
  has_many :meals, dependent: :destroy
  has_many :daily_order_meals, dependent: :destroy

  scope :ordered, -> { order(title: :asc) }

  validates :title, presence: true
end
