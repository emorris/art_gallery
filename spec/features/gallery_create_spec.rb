require 'rails_helper'

RSpec.feature 'Creating a Gallery' do
  let!(:user) { FactoryGirl.create(:user) }
  before do
    login_as(user)
    visit '/admin'
    click_link 'Galleries'
    click_link 'New Gallery'
  end

  scenario 'with valid data' do
    title = 'title'
    text = 'some magic text'
    fill_in 'Name', with: title
    fill_in 'Text', with: text
    click_button 'Create Gallery'
    within('table#galleries') do
      expect(page).to have_content title
      expect(page).to have_content text
    end
    visit '/'
    expect(page).to have_content title
    expect(page).to have_content text
  end

  scenario 'with invalid data' do
    title = ''
    text = 'some magic text'
    fill_in 'Name', with: title
    fill_in 'Text', with: text
    click_button 'Create Gallery'
    within('.gallery_name') do
      expect(page).to have_content("can't be blank")
    end
  end
end