require 'rails_helper'

RSpec.feature 'Pictures' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:gallery) { FactoryGirl.create(:gallery) }
  before do
    login_as(user)
    visit '/admin'
    click_link 'Galleries'
    page.find('.panel-heading', text: gallery.name).click_link('Edit')
  end

  scenario 'add a new picture', :js => true  do 
    click_link 'Pictures'
    sleep 2
  end

  # scenario 'reorder some pictures' do

  # end

  # scenario 'delete a pictures' do

  # end

  # scenario 'edit a pictures' do

  # end
  
end