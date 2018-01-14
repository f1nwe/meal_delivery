# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Account::DashboardController, type: :controller do
  let(:user) { create(:user) }
  before :each do
    sign_in user
  end

  describe 'GET #callendar' do
    it 'returns http success' do
      get :calendar
      expect(response).to have_http_status(:success)
    end
  end
end
