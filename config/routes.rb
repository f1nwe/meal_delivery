# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :users, only: %i[index show]
  end

  devise_for :users

  namespace :account do
    resource :profile, only: %i[edit update]
  end

  root 'account/profiles#edit' # TODO: temporary
end
