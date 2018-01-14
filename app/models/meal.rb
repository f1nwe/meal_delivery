# frozen_string_literal: true

# == Schema Information
#
# Table name: meals
#
#  id             :integer          not null, primary key
#  type           :string           not null
#  name           :string
#  photo          :string
#  menu_id        :integer
#  price_kopiykas :integer          default(0), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Meal < ApplicationRecord
  mount_uploader :photo, ::PhotoUploader
  monetize :price_kopiykas
  belongs_to :menu

  validates :type,  presence: true
  validates :price, presence: true
  validates :name,  presence: true
end
