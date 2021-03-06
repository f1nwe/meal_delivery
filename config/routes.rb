# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  namespace :admin do
    resources :api_clients,     except: %i[show]
    resources :daily_orders,    only:   %i[show]
    resources :meal_categories, except: %i[show]
    resources :menus,           except: %i[destroy]
    resources :users,           only:   %i[index show]

    get 'dates',       to: 'dates#index'
    get 'dates/:date', to: 'dates#show', as: 'date'
  end

  namespace :account do
    resources :daily_orders, only: %i[show new create]
    resource  :profile,      only: %i[edit update]

    get 'dates',       to: 'dates#index'
    get 'dates/:date', to: 'dates#show', as: 'date'

    get 'calendar', to: 'dashboard#calendar'
  end

  namespace :api do
    namespace :v1 do
      resources :daily_orders, only: %i[index]
    end
  end

  root 'account/dates#index'
end
