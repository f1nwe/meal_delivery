# == Schema Information
#
# Table name: meal_categories
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :meal_category do
    title "MyString"
  end
end
