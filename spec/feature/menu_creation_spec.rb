# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Menu creation' do
  let!(:meal_category) { create(:meal_category, title: 'Drinks') }
  let!(:user)          { create(:user, :admin) }

  scenario 'creates menu' do
    login_as user

    visit admin_menus_path

    expect(page).to have_selector(:link, 'Create menu for today')

    click_link('Create menu for today')

    expect(current_path).to eq(new_admin_menu_path)

    expect(find('#menu_meals_attributes_0_name')).to be_present

    find('.nested-fields').fill_in('Name', with: 'Cola')

    expect do
      click_button('Create Menu')
    end.to change { Menu.count }.by(1)

    menu = Menu.last

    expect(menu.meals.where(name: 'Cola')).to be_any
  end
end
