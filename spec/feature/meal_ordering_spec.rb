# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Meal ordering' do
  let!(:meal_category) { create(:meal_category, title: 'Drinks') }
  let!(:user)          { create(:user) }
  let!(:menu)          { create(:menu, date: Time.zone.today) }
  let!(:meal)          { create(:meal, menu: menu, meal_category: meal_category, name: 'Cola') }

  before :each do
    login_as user
  end

  scenario 'creates new order' do
    visit '/'
    expect(current_path).to eq('/')
    expect(page).to have_selector(:link, 'Order meals for today')

    click_link('Order meals for today')
    expect(current_path).to eq(new_account_daily_order_path)

    within '#new_daily_order' do
      select('Cola', from: 'Drink')
    end
    expect do
      click_button('Create Daily order')
    end.to change { user.daily_orders.count }.by(1)

    daily_order = user.daily_orders.last

    expect(current_path).to eq(account_daily_order_path(daily_order))
    expect(find('body'))
      .to have_content("Daily order on #{I18n.l(daily_order.date, format: :long)}")
    expect(find('table')).to have_content('Cola')
  end
end
