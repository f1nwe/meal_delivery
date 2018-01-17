# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Account::DailyOrdersController, type: :controller do
  let(:user)  { create(:user, :admin) }
  let!(:menu) { create(:menu) }

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
      get :new, params: { date: menu.date }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #create' do
    let(:meals) { create_list(:meal, 5, menu: menu) }

    subject do
      post :create, params: { date: menu.date, daily_order: { meal_ids: meals.pluck(:id) } }
    end

    it { is_expected.to have_http_status(302) }
    it { is_expected.to redirect_to(account_daily_order_url(DailyOrder.last.id)) }

    it 'changes daily_order count' do
      expect { subject }.to change(DailyOrder, :count).by(1)
    end

    it 'changes daily_order_meals count' do
      expect { subject }.to change(DailyOrderMeal, :count).by(meals.count)
    end
  end
end
