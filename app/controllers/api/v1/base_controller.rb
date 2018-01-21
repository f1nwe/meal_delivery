# frozen_string_literal: true

module Api
  module V1
    class BaseController < Api::BaseController
      before_action :authenticate

      private

      def authenticate
        authenticate_access_token || render_unauthorized
      end

      def authenticate_access_token
        authenticate_with_http_token do |token|
          ApiClient.exists?(access_token: token)
        end
      end

      def render_unauthorized
        render json: { status: 'unauthorized' }, status: 401
      end
    end
  end
end
