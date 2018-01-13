# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  namespace :account do
    resource :profile, only: %i[edit update]
  end

  root 'account/profiles#edit' # TODO: temporary
end
