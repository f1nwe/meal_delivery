# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    # POST /resource
    def create
      super do
        resource.make_admin if resource.first?
      end
    end
  end
end
