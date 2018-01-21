# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do
  include_examples 'unauthenticated', actions: %i[index show]
  include_examples 'authorized_as_client', actions: %i[index show]

  context 'when logged as admin user' do
    let(:user) { create(:user, :admin) }

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
        get :show, params: { id: user.id }
        expect(response).to have_http_status(:success)
      end
    end
  end
end
