# frozen_string_literal: true

ruby '2.5.0'

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'bootstrap-sass', '~> 3.3.6'
gem 'carrierwave', '~> 1.0'
gem 'cocoon'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'fog-aws'
gem 'font-awesome-rails'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'kaminari'
gem 'mini_magick'
gem 'money-rails'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.4'
gem 'sass-rails', '~> 5.0'
gem 'select2-rails'
gem 'simple_calendar', '~> 2.0'
gem 'simple_form'
gem 'slim-rails'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'unobtrusive_flash', '>=3'

# TODO: do not need in production (for seeding in prod)
gem 'awesome_print'
gem 'database_cleaner'
gem 'factory_bot_rails'
gem 'faker', git: 'git://github.com/stympy/faker.git', branch: 'master'

group :development, :test do
  gem 'pry-rails'
end

group :development do
  gem 'annotate'
  gem 'brakeman', require: false
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rails_best_practices'
  gem 'reek'
  gem 'rubocop', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '~> 2.13'
  gem 'capybara-webkit'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'simplecov'
end
