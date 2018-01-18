# frozen_string_literal: true

# == Schema Information
#
# Table name: daily_orders
#
#  id                  :integer          not null, primary key
#  user_id             :integer
#  date                :date
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  menu_id             :integer
#  total_cost_kopiykas :integer          default(0)
#

FactoryBot.define do
  factory :daily_order do
    association :user, factory: :user
    association :menu, factory: :menu
    date Time.zone.today
  end
end
