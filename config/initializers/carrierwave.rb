require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_provider = 'fog/aws'
      config.fog_credentials = {
        provider:              'AWS',
        aws_access_key_id:     Rails.application.secrets[:aws_access_key_id],
        aws_secret_access_key: Rails.application.secrets[:aws_secret_access_key],
        region:                'eu-central-1',
      }

      config.fog_directory   = Rails.application.secrets[:aws_fog_directory]
  end
end
