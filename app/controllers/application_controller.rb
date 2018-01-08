# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # TODO: move to the base controller of client app
  after_action :prepare_unobtrusive_flash
end
