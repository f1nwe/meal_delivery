# frozen_string_literal: true

require 'spec_helper'
require 'simplecov'

SimpleCov.start

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

# Prevent database truncation if the environment is production

abort('The Rails environment is running in production mode!') if Rails.env.production?

require 'rspec/rails'
require 'capybara/rspec'

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each do |file|
    require file
  end

  config.render_views

  # database cleaner
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  # configuring capybara
  Capybara.javascript_driver = :webkit

  # include methods depending on file location
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!

  # include factory bot methods
  config.include FactoryBot::Syntax::Methods

  # inlude custom macroeses into spec
  #
  config.include(ControllerMacros, type: :controller)
  config.include(Warden::Test::Helpers, type: :feature)
end

# configure shoulda matchers
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
