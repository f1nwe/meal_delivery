# frozen_string_literal: true
# == Schema Information
#
# Table name: meals
#
#  id               :integer          not null, primary key
#  type             :string           not null
#  name             :string
#  photo            :string
#  menu_id          :integer
#  price_kopiykas   :integer          default(0), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  meal_category_id :integer
#

require 'rails_helper'

RSpec.describe Meal, type: :model do
  include_examples 'valid_factories', :meal

  describe 'associations' do
    it { should belong_to(:menu) }
  end
end
