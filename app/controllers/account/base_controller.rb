# frozen_string_literal: true

module Account
  class BaseController < ApplicationController
    layout 'account/application'
    before_action :authenticate_user!
  end
end
