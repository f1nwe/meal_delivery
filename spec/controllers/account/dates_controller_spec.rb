# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Account::DatesController, type: :controller do
  let(:user) { create(:user, :admin) }

  before :each do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns http success if date is valid' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    let!(:date)        { Time.zone.today }
    let!(:menu)        { create(:menu, date: date) }
    let!(:daily_order) { create(:daily_order, user: user, menu: menu, date: date) }

    it 'returns http success if date is valid' do
      get :show, params: { date: date.to_s }
      expect(response).to have_http_status(:success)
    end

    it 'returns http not found if date is invalid' do
      expect do
        get :show, params: { date: Faker::Lorem.word }
      end.to raise_error(ActionController::RoutingError)
    end
  end
end
