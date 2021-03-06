# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Authorization

  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :prepare_unobtrusive_flash

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def not_found
    raise ActionController::RoutingError, 'Not Found'
  end
end
