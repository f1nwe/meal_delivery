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

require 'rails_helper'

RSpec.describe ApiClient, type: :model do
  include_examples 'valid_factories', :api_client

  describe 'generates access_token on create' do
    let(:api_client) { create(:api_client) }

    it 'access_token is present' do
      expect(api_client.access_token).to be_present
    end
  end
end
