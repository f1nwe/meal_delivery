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

class Meal < ApplicationRecord
  mount_uploader :photo, ::PhotoUploader
  monetize :price_kopiykas

  has_many :daily_order_meals, dependent: :restrict_with_error
  has_many :daily_orders, through: :daily_order_meals

  belongs_to :meal_category
  belongs_to :menu

  accepts_nested_attributes_for :meal_category

  validates :price, presence: true
  validates :name,  presence: true

  before_save :update_total_cost_for_orders, if: :price_kopiykas_changed?

  private

  def update_total_cost_for_orders
    Services::DailyOrdersTotalCost.new(daily_orders).calculate!
  end
end
