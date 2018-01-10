# frozen_string_literal: true

module Account
  class ProfileController < BaseController
    def show
      @user = current_user
    end
  end
end
