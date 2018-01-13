# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  email               :string           default(""), not null
#  name                :string           default(""), not null
#  encrypted_password  :string           default(""), not null
#  remember_created_at :datetime
#  role                :integer          default("client")
#

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

    # dynamicaly set traits for all user roles
    User::ROLES.each do |role_name|
      trait role_name do
        role role_name
      end
    end
  end
end
