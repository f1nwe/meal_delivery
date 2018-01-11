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

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  ROLES = %i[user admin].freeze

  enum role: ROLES

  before_create :set_admin, if: :first_user?

  validates :name, presence: true, length: { in: 3..15 }

  private

  def set_admin
    self.role = :admin
  end

  def first_user?
    self.class.count.zero?
  end
end
