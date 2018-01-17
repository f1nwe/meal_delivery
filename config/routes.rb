# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  namespace :admin do
    resources :users,           only:   %i[index show]
    resources :menus,           except: %i[destroy]
    resources :meal_categories, except: %i[show]

    get 'dates',       to: 'dates#index'
    get 'dates/:date', to: 'dates#show', as: 'date'
  end

  namespace :account do
    resource  :profile,      only: %i[edit update]
    resources :daily_orders, only: %i[show new create]

    get 'calendar', to: 'dashboard#calendar'
  end

  root 'account/dashboard#calendar'
end
