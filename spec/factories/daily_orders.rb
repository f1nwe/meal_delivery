# frozen_string_literal: true

# == Schema Information
#
# Table name: daily_orders
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  date       :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  menu_id    :integer
#

FactoryBot.define do
  factory :daily_order do
    association :user, factory: :user
    association :menu, factory: :menu
    sequence :date do |n|
      n.days.ago
    end
  end
end
