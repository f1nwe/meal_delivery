# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Account::DailyOrdersController, type: :controller do
  let(:user) { create(:user, :admin) }

  before :each do
    sign_in user
  end

  describe 'GET #show' do
    let(:daily_order) { create(:daily_order, user: user) }
    it 'returns http success' do
      get :show, params: { id: daily_order.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #create' do
    it 'returns http success' do
      skip
      get :create
      expect(response).to have_http_status(:success)
    end
  end
end
