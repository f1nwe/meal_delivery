# frozen_string_literal: true

module Authorization
  extend ActiveSupport::Concern

  included do
    def authorize!(roles, fallback_location: root_path)
      allowed_roles = [roles].flatten.map(&:to_s)

      return if allowed_roles.include?(current_user.role)

      flash[:error] = 'You are not allowed to open this page'
      redirect_back(fallback_location: fallback_location)
    end
  end
end
