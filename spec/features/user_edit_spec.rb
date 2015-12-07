require 'rails_helper'

RSpec.feature 'Editing User' do
  let!(:logged_in_user) { FactoryGirl.create(:user) }
  let!(:edit_user) { FactoryGirl.create(:user) }
  before do 
    login_as(logged_in_user)
    visit '/admin'
    click_link 'Users'
    page.find('tr', text: edit_user.email).click_link('Edit')
  end

  scenario 'with valid data' do
    email_new = 'evan@example.com'
    email_old = edit_user.email
    fill_in 'Email', with: email_new
    fill_in 'Password', with: 'passwordzzz34'
    click_button 'Update User'
    within('table#users') do
      expect(page).to have_content email_new
      expect(page).to_not have_content email_old
    end
  end

  scenario 'you can edit your own account and not get logged out' do
    visit '/admin'
    click_link 'Users'
    page.find('tr', text: logged_in_user.email).click_link('Edit')
    email_new = 'evan@example.com'
    fill_in 'Email', with: email_new
    fill_in 'Password', with: 'passwordzzz34'
    click_button 'Update User'
    within('table#users') do
      expect(page).to have_content email_new
      expect(page).to_not have_content logged_in_user.email
    end
  end

  scenario 'with invalid data' do
    fill_in 'Email', with: 'evan'
    fill_in 'Password', with: 'p'
    click_button 'Update User'
    within('.user_email') do
      expect(page).to have_content('is invalid')
    end
    within('.user_password') do
      expect(page).to have_content('is too short')
    end
  end

  scenario 'with non unique email' do
    fill_in 'Email', with: logged_in_user.email
    fill_in 'Password', with: logged_in_user.password
    click_button 'Update User'
    within('.user_email') do
      expect(page).to have_content 'has already been taken'
    end
  end

end