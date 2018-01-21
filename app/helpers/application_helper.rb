# frozen_string_literal: true

module ApplicationHelper
  %w[index new create show edit update destroy].each do |action|
    define_method "#{action}_action?" do
      params[:action] == action
    end
  end
end
