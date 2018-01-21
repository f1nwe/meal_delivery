# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Meal category creation' do
  let!(:user) { create(:user, :admin) }

  scenario 'creates meal_category' do
    login_as user

    visit admin_meal_categories_path

    expect(page).to have_selector(:link, 'Create')

    click_link('Create')

    expect(current_path).to eq(new_admin_meal_category_path)

    within '#new_meal_category' do
      fill_in('Title', with: 'Drinks')
      expect do
        click_button('Create Meal category')
      end.to change { MealCategory.count }.by(1)
    end

    expect(MealCategory.where(title: 'Drinks')).to be_any
  end
end
