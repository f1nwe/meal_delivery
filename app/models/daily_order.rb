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

class DailyOrder < ApplicationRecord
  belongs_to :menu
  belongs_to :user
  has_many :daily_order_meals, dependent: :destroy
  has_many :meals, through: :daily_order_meals

  scope :ordered,  -> { order(date: :asc) }
  scope :in_month, ->(date) { where(date: date.beginning_of_month..date.end_of_month) }
end
