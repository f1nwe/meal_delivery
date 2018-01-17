# frozen_string_literal: true
# == Schema Information
#
# Table name: meals
#
#  id               :integer          not null, primary key
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
    association :menu, factory: :menu
    name { Faker::Lorem.word }
    association :meal_category, factory: :meal_category
    price_kopiykas { Faker::Number.positive(1000, 10_000) }
  end
end
