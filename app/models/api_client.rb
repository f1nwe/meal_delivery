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

class ApiClient < ApplicationRecord
  before_create :set_access_token

  private

  def set_access_token
    begin
      self.access_token = SecureRandom.hex
    end while self.class.exists?(access_token: access_token)
  end
end
