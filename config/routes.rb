# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  namespace :account do
    resource :profile, only: %i[show edit update]
  end

  root 'account/profile#show'
end
