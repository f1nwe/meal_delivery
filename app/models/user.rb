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

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  ROLES = %i[client admin].freeze
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  enum role: ROLES

  before_create :set_admin, if: :first_user?

  scope :ordered, -> { order(email: :asc) }

  validates :name, presence: true, length: { in: 3..30 }
  validates :email, format: { with: VALID_EMAIL_REGEX }

  private

  def set_admin
    self.role = :admin
  end

  def first_user?
    self.class.count.zero?
  end
end
