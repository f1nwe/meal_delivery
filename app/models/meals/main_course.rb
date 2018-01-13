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

module Meals
  class MainCourse < ::Meal
  end
end
