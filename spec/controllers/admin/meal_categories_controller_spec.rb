# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::MealCategoriesController, type: :controller do
  context 'authorized as admin' do
    let(:user)           { create(:user, :admin) }
    let!(:meal_category) { create(:meal_category) }

    before :each do
      sign_in user
    end

    describe 'GET #index' do
      it 'returns correct http status' do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #new' do
      it 'returns correct http status' do
        get :new
        expect(response).to have_http_status(:success)
      end
    end

    describe 'POST #create' do
      let(:meal_category_params) { attributes_for(:meal_category) }

      it 'returns correct http status' do
        post :create, params: { meal_category: meal_category_params }
        expect(response).to have_http_status(302)
      end

      it 'redirects to index' do
        expect(
          post :create, params: { meal_category: meal_category_params }
        ).to redirect_to(admin_meal_categories_path)
      end

      it 'changes meal_categories count' do
        expect do
          post :create, params: { meal_category: meal_category_params }
        end.to change { MealCategory.count }.by(1)
      end
    end

    describe 'GET #edit' do
      it 'returns correct http status' do
        get :edit, params: { id: meal_category.id }
        expect(response).to have_http_status(:success)
      end
    end

    describe 'PATCH #update' do
      let(:new_title) { Faker::Lorem.word }
      it 'returns correct http status' do
        patch :update, params: { id: meal_category.id, meal_category: { title: new_title } }
        expect(response).to have_http_status(302)
      end

      it 'updates meal_category title' do
        patch :update, params: { id: meal_category.id, meal_category: { title: new_title } }
        expect(meal_category.reload.title).to eq(new_title)
      end

      it 'redirects to index' do
        expect(
          patch :update, params: { id: meal_category.id, meal_category: { title: new_title } }
        ).to redirect_to(admin_meal_categories_path)
      end
    end

    describe 'GET #destroy' do
      it 'returns correct http status' do
        delete :destroy, params: { id: meal_category.id }
        expect(response).to have_http_status(302)
      end

      it 'changes meal_categories count' do
        expect do
          delete :destroy, params: { id: meal_category.id }
        end.to change { MealCategory.count }.by(-1)
      end

      it 'redirects to index' do
        expect(
          delete :destroy, params: { id: meal_category.id }
        ).to redirect_to(admin_meal_categories_path)
      end
    end
  end
end
