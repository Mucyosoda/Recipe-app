require 'rails_helper'

RSpec.describe 'Foods', type: :system do
  it 'check for foods' do
    visit '/users/sign_in'
    user = User.create!(name: 'Goodman', email: 'ahmedreda152@gmail.com', password: 'password', confirmed_at: Time.now)
    fill_in 'user_email', with: 'ahmedreda152@gmail.com'
    fill_in 'user_password', with: 'password'
    click_button 'Log in'

    food1 = user.foods.create(name: 'pineapple', measurement_unit: '3', price: 3)
    food2 = user.foods.create(name: 'chicken', measurement_unit: '3', price: 12)

    click_link 'Foods'

    expect(page).to have_content(food1.name)
    expect(page).to have_content(food1.measurement_unit)
    expect(page).to have_content('3')

    expect(page).to have_content(food2.name)
    expect(page).to have_content(food2.measurement_unit)
    expect(page).to have_content('12')
  end

  it 'removes food' do
    visit '/users/sign_in'
    user = User.create!(name: 'Goodman', email: 'ahmedreda152@gmail.com', password: 'password', confirmed_at: Time.now)
    fill_in 'user_email', with: 'ahmedreda152@gmail.com'
    fill_in 'user_password', with: 'password'
    click_button 'Log in'

    food1 = user.foods.create(name: 'pineapple', measurement_unit: '2', price: 3)

    click_link 'Foods'

    click_button 'Delete'

    expect(page).to_not have_content(food1.name)
    expect(page).to_not have_content(food1.measurement_unit)
    expect(page).to_not have_content('3')
  end
end
