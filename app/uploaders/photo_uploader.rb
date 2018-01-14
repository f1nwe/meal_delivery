# frozen_string_literal: true

class PhotoUploader < ApplicationUploader
  def extension_whitelist
    %w[jpg jpeg gif png]
  end

  def default_url
    ActionController::Base.helpers.asset_path('fallback/meal.png')
  end
end
