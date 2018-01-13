# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Account::ProfilesController, type: :controller do
  let(:user) { create(:user) }

  context 'when user is logged in' do
    before :each do
      sign_in user
    end

    describe 'GET #edit' do
      it 'returns 200 http state' do
        get :edit

        expect(response).to have_http_status(200)
      end
    end

    describe 'PATCH #update' do
      context 'with valid data' do
        let(:user_params) { attributes_for(:user) }

        it 'updates user' do
          patch :update, params: { user: user_params }

          user.reload

          expect(user.name).to eq(user_params[:name])
          expect(user.email).to eq(user_params[:email])
        end
      end

      context 'with invalid data' do
        let(:user_params) { { email: 'invalid email', name: 'i' } }

        it 'updates user' do
          user_attrs = user.attributes
          patch :update, params: { user: user_params }

          user.reload

          expect(user.name).to eq(user_attrs['name'])
          expect(user.email).to eq(user_attrs['email'])
        end
      end
    end
  end
  context 'when user is not logged in' do
    describe 'GET #edit' do
      it 'returns 302 http state' do
        get :edit

        expect(response).to have_http_status(302)
      end
    end
    describe 'PATCH #update' do
      it 'returns 302 http state' do
        get :update

        expect(response).to have_http_status(302)
      end
    end
  end
end
