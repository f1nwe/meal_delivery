# frozen_string_literal: true

class PhotoUploader < ApplicationUploader
  process resize_to_fit: [1920, 1080]

  def extension_whitelist
    %w[jpg jpeg gif png]
  end

  def default_url
    ActionController::Base.helpers.asset_path('fallback/meal.png')
  end
end
