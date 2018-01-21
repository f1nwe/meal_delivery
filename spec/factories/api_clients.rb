# frozen_string_literal: true

# == Schema Information
#
# Table name: api_clients
#
#  id           :integer          not null, primary key
#  access_token :string
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryBot.define do
  factory :api_client do
    name { Faker::Lorem.word }
  end
end
