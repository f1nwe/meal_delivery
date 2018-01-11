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
#  role                :integer          default("user")
#

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has valid factories' do
    expect(build(:user)).to be_valid
  end
end
