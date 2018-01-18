# frozen_string_literal: true

module Admin
  class BaseController < Account::BaseController
    before_action { authorize! :admin }
  end
end
