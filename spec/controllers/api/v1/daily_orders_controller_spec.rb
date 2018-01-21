# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::DailyOrdersController, type: :controller do
  let!(:user)        { create(:user) }
  let!(:menu)        { create(:menu) }
  let!(:meal)        { create(:meal, menu: menu) }
  let!(:daily_order) { create(:daily_order, menu: menu, meals: [meal], user: user) }

  context 'authorized' do
    let(:api_client) { create(:api_client) }

    before :each do
      authorize_api(api_client)
    end

    describe 'GET #index' do
      it 'returns http success' do
        get :index, format: :json
        expect(response).to have_http_status(:success)
      end

      it 'returns correct response' do
        get :index, format: :json

        expect(api_response['status']).to eq('success')

        data = api_response['data']

        expect(data['daily_orders']).to be_any

        order_data = data['daily_orders'].first

        expect(order_data).to be_present

        user_data = order_data['user']

        expect(user_data).to be_present
        expect(user_data['id']).to eq(user.id)
        expect(user_data['name']).to eq(user.name)

        meals_data = order_data['meals']

        expect(meals_data).to be_any

        meal_data = meals_data.first

        expect(meal_data['id']).to eq(meal.id)
        expect(meal_data['name']).to eq(meal.name)
      end
    end
  end

  context 'Unathorized' do
    describe 'GET #index' do
      it 'returns http success' do
        get :index, format: :json
        expect(response).to have_http_status(401)
      end

      it 'correct_response' do
        get :index, format: :json
        expect(api_response['status']).to eq('unauthorized')
      end
    end
  end
end
