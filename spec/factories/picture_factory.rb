FactoryGirl.define do
   factory :picture do
    sequence(:title) {|n| "title #{n}"}
    sequence(:text) {|n| "text #{n}"}
    sequence(:sort) {|n| n}
    sequence(:image_file) {|n| File.new("#{Rails.root}/spec/fixtures/#{n%4}.jpg") }
  end
end