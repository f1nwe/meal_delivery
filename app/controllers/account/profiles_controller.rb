# frozen_string_literal: true

module Account
  class ProfilesController < BaseController
    before_action :init_user, only: %i[edit update]

    def edit; end

    def update
      if @user.update(user_params)
        redirect_to edit_account_profile_path
      else
        render :edit
      end
    end

    private

    def init_user
      @user = current_user
    end

    def user_params
      uparams = params.require(:user)

      sanitize_user_password!(uparams)

      uparams.permit(:name, :email, :password, :password_confirmation,
                     :remember_created_at)
    end

    def sanitize_user_password!(uparams)
      return if uparams[:password].present?

      uparams.delete('password')
      uparams.delete('password_confirmation')
    end
  end
end
