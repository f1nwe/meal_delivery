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

require 'rails_helper'

RSpec.describe Menu, type: :model do
  include_examples 'valid_factories', :menu

  describe 'associations' do
    it { should have_many(:meals) }
    it { should have_many(:first_courses) }
    it { should have_many(:main_courses) }
    it { should have_many(:drinks) }
  end
end
