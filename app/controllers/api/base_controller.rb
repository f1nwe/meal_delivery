# frozen_string_literal: true

module Api
  class BaseController < ApplicationController
    skip_before_action :verify_authenticity_token
    respond_to :json
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    private

    def record_not_found
      render json: {
        status: 'not_found',
        data: { message: 'Entity not found' }
      }, status: :not_found
    end
  end
end
