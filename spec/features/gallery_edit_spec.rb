require 'rails_helper'

RSpec.feature 'Creating a Gallery' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:gallery) { FactoryGirl.create(:gallery) }
  before do
    login_as(user)
    visit '/admin'
    click_link 'Galleries'
    page.find('.panel-heading', text: gallery.name).click_link('Edit')
  end

  scenario 'with valid data' do
    title = "#{gallery.name}  new title"
    text = "#{gallery.text} some magic text"
    fill_in 'Name', with: title
    fill_in 'Text', with: text
    click_button 'Update Gallery'
    within('.panel-heading') do
      expect(page).to have_content title
      click_link 'Edit'
    end
    expect(page).to have_content text
    visit '/'
    expect(page).to have_content title
    expect(page).to have_content text
  end

  scenario 'with invalid data' do
    title = ''
    text = 'some magic text'
    fill_in 'Name', with: title
    fill_in 'Text', with: text
    click_button 'Update Gallery'
    within('.gallery_name') do
      expect(page).to have_content("can't be blank")
    end
  end
end