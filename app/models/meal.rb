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

  has_many :daily_order_meals, dependent: :destroy
  has_many :daily_order, through: :daily_order_meals

  belongs_to :meal_category
  belongs_to :menu

  accepts_nested_attributes_for :meal_category

  validates :price, presence: true
  validates :name,  presence: true
end
