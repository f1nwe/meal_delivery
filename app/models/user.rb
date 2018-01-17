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

  has_many :daily_orders, dependent: :destroy

  scope :ordered, -> { order(email: :asc) }

  validates :name, presence: true, length: { in: 3..30 }
  validates :email, format: { with: VALID_EMAIL_REGEX }

  def first?
    first_user = self.class.first

    (first_user == self) || first_user.nil?
  end

  def make_admin
    update(role: :admin)
  end
end
