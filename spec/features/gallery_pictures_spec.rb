require 'rails_helper'

RSpec.feature 'Pictures' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:gallery) { FactoryGirl.create(:gallery) }
  before do
    login_as(user)
    visit '/admin'
    click_link 'Galleries'
    page.find('.panel-heading', text: gallery.name).click_link('Edit')
    click_link 'Pictures'
  end

  scenario 'add a new picture', :js => true  do 
    new_title = "some Title"
    new_text = "some Text"
    within("#pictures") do 
      page.first('.title').set(new_title)
      page.first('.text').set(new_text)
    end
    click_button "Submit Picture Edits"
    page.find('.panel-heading', text: gallery.name).click_link('Edit')
    click_link 'Pictures'
    expect(page).to have_selector("input[value='#{new_title}']")
    expect(page).to have_selector("input[value='#{new_text}']")
  end

  scenario 'file drag and drop', :js => true do
    new_image = "4.jpg"
    page.execute_script("seleniumUpload = window.$('<input/>').attr({id: 'seleniumUpload', type:'file'}).appendTo('body');")
    attach_file('seleniumUpload', "#{Rails.root}/spec/fixtures/#{new_image}")
    page.execute_script("e = $.Event('drop'); e.originalEvent = {dataTransfer : { files : seleniumUpload.get(0).files } }; $('#image_file').trigger(e);")
    within("#pictures") do 
      expect(page).to have_css("img[src*='#{new_image}']")
    end
  end

  scenario 'reorder some pictures', :js => true do
    img_moved_src = ""
    within("#pictures") do 
      imgs = page.all('img')
      img_moved =  imgs.first
      img_last =  imgs.last
      img_moved_src = img_moved['src']
      img_moved.drag_to(img_last)
    end
    click_button "Submit Picture Edits"
    page.find('.panel-heading', text: gallery.name).click_link('Edit')
    click_link 'Pictures'
    within("#pictures") do 
      expect(page.all('img').last['src']).to eq img_moved_src
    end
  end

  scenario 'delete a pictures', :js => true do
    link = ""
    within("#pictures tbody") do 
      tr = page.all('tr').first
      link = tr.find('img')['src']
      tr.click_link("Delete")
      page.accept_confirm
      expect(page).to have_no_css("img[src='#{link}']")
    end
  end

  scenario 'edit a pictures', :js => true do
    new_title = "New title"
    new_text = "some Text"
    within("#pictures tbody") do 
      tr = page.all('tr').first
      tr.find('.title').set(new_title)
      tr.find('.text').set(new_text)
    end

    click_button "Submit Picture Edits"
    page.find('.panel-heading', text: gallery.name).click_link('Edit')
    click_link 'Pictures'
    
    expect(page).to have_selector("input[value='#{new_title}']")
    expect(page).to have_selector("input[value='#{new_text}']")
  end
  
end