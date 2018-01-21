# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'ApiCLient creation' do
  let!(:user) { create(:user, :admin) }

  scenario 'ApiClient menu' do
    login_as user

    visit admin_api_clients_path

    expect(page).to have_selector(:link, 'Create')

    click_link('Create')

    expect(current_path).to eq(new_admin_api_client_path)

    within '#new_api_client' do
      fill_in('Name', with: 'Cafe')
      expect do
        click_button('Create Api client')
      end.to change { ApiClient.count }.by(1)
    end

    expect(ApiClient.where(name: 'Cafe')).to be_any
  end
end
