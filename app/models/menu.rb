# frozen_string_literal: true

# == Schema Information
#
# Table name: menus
#
#  id         :integer          not null, primary key
#  date       :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Menu < ApplicationRecord
  has_many :meals, inverse_of: :menu, dependent: :nullify
  has_many :daily_orders, dependent: :nullify
  accepts_nested_attributes_for :meals, reject_if: :all_blank, allow_destroy: true

  scope :ordered,  -> { order(date: :asc) }
  scope :in_month, ->(date) { where(date: date.beginning_of_month..date.end_of_month) }

  validates :date, uniqueness: true, presence: true
end
