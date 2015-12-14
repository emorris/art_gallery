require 'rails_helper'

RSpec.feature 'Deleting Galleries' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:gallery) { FactoryGirl.create(:gallery) }
  let!(:gallery2) { FactoryGirl.create(:gallery) }
  before do
    login_as(user)
    visit '/admin'
    click_link 'Galleries'
  end

  scenario 'delete a gallery' do
    page.find('.panel-heading', text: gallery.name).click_link('Delete')
    within('.panel-heading') do
      expect(page).to_not have_content gallery.name
    end
  end
end