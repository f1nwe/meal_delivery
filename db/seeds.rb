# frozen_string_literal: true

require 'database_cleaner'
require 'faker'

class DataSeeder
  def call
    puts 'Start seeding'.green

    clean_db

    seed_users

    puts "\nSeeding finished successfully".green
  end

  private

  def clean_db
    puts "\nClean DB...".yellow
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean
  end

  def seed_users
    seeding('users')

    @users = FactoryBot.create_list(:user, 50, password: '123456')

    @users << FactoryBot.create(:user, :admin, email: 'admin@gmail.com', password: '123456')

    finished
  end

  def seeding(entity_name)
    puts "\nSeeding #{entity_name}...".blue
  end

  def finished
   puts "\nFinished".green
  end
end

DataSeeder.new.call
