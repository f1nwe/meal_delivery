# frozen_string_literal: true

module Admin
  class UsersController < BaseController
    def index
      @users = collection.page(params[:page]).per(15)
    end

    def show
      @user = resource
    end

    private

    def collection
      User.ordered
    end

    def resource
      collection.find(params[:id])
    end
  end
end
