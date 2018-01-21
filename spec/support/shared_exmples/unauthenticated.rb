# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_examples 'unauthenticated' do |options|
  params  = options[:params] || { id: rand(1..100) }
  actions = options[:actions] || []

  context 'unauthenticated user' do
    if actions.include?(:index)
      describe 'GET index' do
        subject do
          get :index
        end

        it { is_expected.to redirect_to(new_user_session_path) }
      end
    end

    if actions.include?(:new)
      describe 'GET new' do
        subject do
          get :new
        end

        it { is_expected.to redirect_to(new_user_session_path) }
      end
    end

    if actions.include?(:show)
      describe 'GET show' do
        subject do
          get :show, params: params
        end

        it { is_expected.to redirect_to(new_user_session_path) }
      end
    end

    if actions.include?(:create)
      describe 'GET show' do
        subject do
          post :create, params: params
        end

        it { is_expected.to redirect_to(new_user_session_path) }
      end
    end

    if actions.include?(:edit)
      describe 'GET edit' do
        subject do
          get :edit, params: params
        end

        it { is_expected.to redirect_to(new_user_session_path) }
      end
    end

    if actions.include?(:update)
      describe 'GET edit' do
        subject do
          patch :update, params: params
        end

        it { is_expected.to redirect_to(new_user_session_path) }
      end
    end

    if actions.include?(:destroy)
      describe 'GET edit' do
        subject do
          delete :destroy, params: params
        end

        it { is_expected.to redirect_to(new_user_session_path) }
      end
    end
  end
end
