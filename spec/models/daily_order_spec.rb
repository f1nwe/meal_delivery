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

require 'rails_helper'

RSpec.describe DailyOrder, type: :model do
  include_examples 'valid_factories', :daily_order
end
