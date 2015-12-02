require 'rails_helper'
RSpec.feature 'Admin login' do
  let!(:user) { FactoryGirl.create(:user) }

  before do
    visit '/admin'
  end

  scenario 'with valid user' do
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect(page).to have_content('Signed in successfully.')
    click_link 'Logout'
    expect(page).to have_content('Signed out successfully.')
  end

  scenario 'with invalid data' do
    fill_in 'Email', with: user.email + 'z'
    fill_in 'Password', with: user.password + 'z'
    click_button 'Log in'
    expect(page).to have_content('Invalid email or password.')
  end
end
