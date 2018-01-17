# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :users,           only:   %i[index show]
    resources :menus,           except: %i[destroy]
    resources :meal_categories, except: %i[show]

    get 'dates',       to: 'dates#index'
    get 'dates/:date', to: 'dates#show', as: 'date'
  end

  devise_for :users

  namespace :account do
    resource  :profile,      only: %i[edit update]
    resources :daily_orders, only: %i[show new create]

    get 'calendar', to: 'dashboard#calendar'
  end

  root 'account/dashboard#calendar'
end
