# frozen_string_literal: true

module DateParser
  extend ActiveSupport::Concern

  included do
    def date
      Date.parse(params[:date])
    rescue ArgumentError, TypeError
      not_found
    end
  end
end
