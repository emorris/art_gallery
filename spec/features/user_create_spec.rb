require 'rails_helper'

RSpec.feature 'Creating a user' do
  let!(:user) { FactoryGirl.create(:user) }
  before do
    login_as(user)
    visit '/admin'
    click_link 'Users'
    click_link 'New User'
  end

  scenario 'with valid data' do
    email = 'evan@example.com'
    fill_in 'Email', with: email
    fill_in 'Password', with: 'passwordzzz34'
    click_button 'Create User'
    within('table#users') do
      expect(page).to have_content email
    end
  end

  scenario 'with invalid data' do
    fill_in 'Email', with: 'evan'
    fill_in 'Password', with: 'p'
    click_button 'Create User'
    within('.user_email') do
      expect(page).to have_content('is invalid')
    end
    within('.user_password') do
      expect(page).to have_content('is too short')
    end
  end

  scenario 'with non unique email' do
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Create User'
    within('.user_email') do
      expect(page).to have_content 'has already been taken'
    end
  end
end
