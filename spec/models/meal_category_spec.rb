# frozen_string_literal: true

# == Schema Information
#
# Table name: meal_categories
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe MealCategory, type: :model do
  include_examples 'valid_factories', :meal_category
end
