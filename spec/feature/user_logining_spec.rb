# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'User loging' do
  let!(:user) { create(:user, email: 'tom@gmail.com', password: '123456') }
  scenario 'redirects to root if valid creds' do
    visit '/'
    expect(current_path).to eq(new_user_session_path)
    within('form#new_user') do
      fill_in 'Email', with: 'tom@gmail.com'
      fill_in 'Password', with: '123456'
    end

    click_button 'Sign in'
    expect(current_path).to eq('/')
  end

  scenario 'does not login if creds are not valid' do
    visit '/'

    expect(current_path).to eq(new_user_session_path)
    within('form#new_user') do
      fill_in 'Email', with: 'stom@gmail.com'
      fill_in 'Password', with: '12sss3456'
    end

    click_button 'Sign in'
    expect(current_path).to eq(new_user_session_path)
  end
end
