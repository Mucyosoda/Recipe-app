require 'rails_helper'

RSpec.describe 'Login', type: :system do
  it 'shows the login page' do
    visit '/users/sign_in'
    expect(page).to have_content('Log in')
  end

  it 'has email, password and login fields in the form' do
    visit '/users/sign_in'
    expect(page).to have_field('Email')
    expect(page).to have_field('Password')
    expect(page).to have_button('Log in')
  end

  it 'inputs proper credentials' do
    visit '/users/sign_in'
    User.create!(name: 'Goodman', email: 'ahmedreda152@gmail.com', password: 'password', confirmed_at: Time.now)
    fill_in 'user_email', with: 'ahmedreda152@gmail.com'
    fill_in 'user_password', with: 'password'
    click_button 'Log in'
    expect(page).to have_current_path('/')
  end
end
