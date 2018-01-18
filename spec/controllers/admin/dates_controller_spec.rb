# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::DatesController, type: :controller do
  let(:user) { create(:user, :admin) }

  before :each do
    sign_in user
  end

  describe 'GET #index' do
    it 'has 200 htpp status' do
      get :index
      expect(response). to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'has 200 htpp status' do
      get :show, params: { date: Time.zone.today.to_s }
      expect(response). to have_http_status(:success)
    end
  end
end
