# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'User registration' do
  scenario 'creates user' do
    visit '/'
    expect(current_path).to eq(new_user_session_path)
    click_link('Sign up')
    within('form#new_user') do
      fill_in 'Email', with: 'tom@gmail.com'
      fill_in 'Name', with: 'Vasya'
      fill_in 'Password', with: '123456'
      fill_in 'Password Confirmation', with: '123456'
    end

    expect do
      click_button 'Sign up'
    end.to change { User.count }.by(1)

    expect(current_path).to eq('/')
  end
end
