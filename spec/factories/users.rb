# frozen_string_literal: true

# Table name: users
#
#  id                  :integer          not null, primary key
#  email               :string           default(""), not null
#  name                :string           default(""), not null
#  encrypted_password  :string           default(""), not null
#  remember_created_at :datetime
#

FactoryBot.define do
  factory :user do
    name     Faker::Name.name
    email    Faker::Internet.email
    password Faker::Internet.password
  end
end
