# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::MenusController, type: :controller do
  let(:user)  { create(:user, :admin) }
  let!(:menu) { create(:menu) }

  before :each do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get :show, params: { id: menu.id }
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
    let(:meal_category) { create(:meal_category) }

    let(:menu_params) do
      meals_attributes = {
        meals_attributes: {
          1 => attributes_for(:meal).merge(meal_category_id: meal_category.id)
        }
      }

      meals_attributes.merge(attributes_for(:menu))
    end

    it 'has correct http status' do
      post :create, params: { menu: menu_params }
      expect(response).to have_http_status(302)
    end

    it 'creates nested meals' do
      post :create, params: { menu: menu_params }
      expect(Menu.last.meals.count).to eq(1)
    end
  end

  describe 'GET #edit' do
    it 'returns http success' do
      get :edit, params: { id: menu.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #update' do
    let!(:menu) { create(:menu) }
    let!(:meal) { create(:meal, menu: menu) }

    it 'updates data' do
      new_meal_name = Faker::Lorem.characters(5)

      put :update, params: {
        id: menu.id,
        menu: {
          meals_attributes: {
            0 => { id: meal.id, name: new_meal_name }
          }
        }
      }

      expect(meal.reload.name).to eq(new_meal_name)
    end
  end
end
