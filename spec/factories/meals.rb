# frozen_string_literal: true
# == Schema Information
#
# Table name: meals
#
#  id               :integer          not null, primary key
#  type             :string           not null
#  name             :string
#  photo            :string
#  menu_id          :integer
#  price_kopiykas   :integer          default(0), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  meal_category_id :integer
#

FactoryBot.define do
  factory :meal do
    meal_classes = %w[Meals::Drink Meals::FirstCourse Meals::MainCourse].freeze

    association :menu, factory: :menu
    type { meal_classes.sample }
    name { Faker::Lorem.word }
    association :meal_category, factory: :meal_category
    price_kopiykas { Faker::Number.positive(1000, 10_000) }

    meal_classes.each do |klass|
      trait_name = klass.split('::').last.underscore.to_sym

      trait trait_name do
        type klass
      end
    end
  end
end
