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

class DailyOrder < ApplicationRecord
  monetize :total_cost_kopiykas

  belongs_to :menu
  belongs_to :user
  has_many :daily_order_meals, dependent: :destroy
  has_many :meals, through: :daily_order_meals

  scope :ordered,  -> { order(date: :asc) }
  scope :in_month, ->(date) { where(date: date.beginning_of_month..date.end_of_month) }

  after_create :calculate_total_cost

  validates :menu_id, uniqueness: { scope: :user_id }
  validates :date,    uniqueness: { scope: :user_id }
  validate  :date_is_today

  delegate :name, to: :user, prefix: true

  def self.total_cost
    @total_cost ||= Money.new(sum(:total_cost_kopiykas))
  end

  def calculate_total_cost
    update(total_cost_kopiykas: meals.sum(:price_kopiykas))
  end

  private

  def date_is_today
    return if date.today?

    errors[:date] << 'You can create order only for today'
  end
end
