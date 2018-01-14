# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::MenusController, type: :controller do
  let(:user) { create(:user, :admin) }
  let(:menu) { create(:menu) }

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
    let(:menu_params) do
      meals_attributes = {
        drinks_attributes:        { 1 => attributes_for(:meal, :drink) },
        first_courses_attributes: { 1 => attributes_for(:meal, :first_course) },
        main_courses_attributes:  { 1 => attributes_for(:meal, :main_course) }
      }

      meals_attributes.merge(attributes_for(:menu))
    end

    it 'has correct http status' do
      post :create, params: { menu: menu_params }
      expect(response).to have_http_status(302)
    end

    it 'creates nested drinks' do
      post :create, params: { menu: menu_params }
      expect(Menu.last.meals.count).to eq(3)
    end
  end

  describe 'GET #edit' do
    it 'returns http success' do
      get :edit, params: { id: menu.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #update' do
    let!(:menu)         { create(:menu) }
    let!(:drink)        { create(:meal, :drink, menu: menu) }
    let!(:first_course) { create(:meal, :first_course, menu: menu) }
    let!(:main_course)  { create(:meal, :main_course, menu: menu) }

    it 'updates data' do
      new_drink_name         = Faker::Lorem.characters(5)
      new_first_course_price = Faker::Number.decimal(2, 2)
      new_main_course_name   = Faker::Lorem.characters(5)

      put :update, params: {
        id: menu.id,
        menu: {
          drinks_attributes: {
            0 => { id: drink.id, name: new_drink_name }
          },
          first_courses_attributes: {
            0 => { id: first_course.id, price: new_first_course_price }
          },
          main_courses_attributes: {
            0 => { id: main_course.id, name: new_main_course_name }
          }
        }
      }

      expect(drink.reload.name).to eq(new_drink_name)
      expect(first_course.reload.price.to_s).to eq(new_first_course_price)
      expect(main_course.reload.name).to eq(new_main_course_name)
    end
  end
end
