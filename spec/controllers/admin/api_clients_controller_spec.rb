# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::ApiClientsController, type: :controller do
  let(:user)        { create(:user, :admin) }
  let!(:api_client) { create(:api_client) }

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
    let(:api_client_params) { attributes_for(:api_client) }

    it 'returns correct http status' do
      post :create, params: { api_client: api_client_params }
      expect(response).to have_http_status(302)
    end

    it 'redirects to index' do
      expect(
        post :create, params: { api_client: api_client_params }
      ).to redirect_to(admin_api_clients_path)
    end

    it 'changes api_clients count' do
      expect do
        post :create, params: { api_client: api_client_params }
      end.to change { ApiClient.count }.by(1)
    end
  end

  describe 'GET #edit' do
    it 'returns correct http status' do
      get :edit, params: { id: api_client.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PATCH #update' do
    let(:new_name) { Faker::Lorem.word }
    it 'returns correct http status' do
      patch :update, params: { id: api_client.id, api_client: { name: new_name } }
      expect(response).to have_http_status(302)
    end

    it 'updates api_client name' do
      patch :update, params: { id: api_client.id, api_client: { name: new_name } }
      expect(api_client.reload.name).to eq(new_name)
    end

    it 'redirects to index' do
      expect(
        patch :update, params: { id: api_client.id, api_client: { name: new_name } }
      ).to redirect_to(admin_api_clients_path)
    end
  end

  describe 'GET #destroy' do
    it 'returns correct http status' do
      delete :destroy, params: { id: api_client.id }
      expect(response).to have_http_status(302)
    end

    it 'changes api_clients count' do
      expect do
        delete :destroy, params: { id: api_client.id }
      end.to change { ApiClient.count }.by(-1)
    end

    it 'redirects to index' do
      expect(
        delete :destroy, params: { id: api_client.id }
      ).to redirect_to(admin_api_clients_path)
    end
  end
end
