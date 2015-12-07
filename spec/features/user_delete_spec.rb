require 'rails_helper'

RSpec.feature 'Deleting User' do
  let!(:logged_in_user) { FactoryGirl.create(:user) }
  let!(:delete_user) { FactoryGirl.create(:user) }
  before do
    login_as(logged_in_user)
    visit '/admin'
    click_link 'Users'
  end

  scenario 'that you are not logged in with' do
    page.find('tr', text: delete_user.email).click_link('Delete')
    within('table#users') do
      expect(page).to_not have_content delete_user.email
    end
  end

  scenario 'but not yourself' do
    page.find('tr', text: logged_in_user.email).click_link('Delete')
    expect(page).to have_content("You can not delete yourself.")
  end
end