FactoryGirl.define do
   factory :picture do
    sequence(:title) {|n| "title #{n}"}
    sequence(:text) {|n| "text #{n}"}
    sequence(:sort) {|n| n}
    image_file { File.new("#{Rails.root}/spec/fixtures/1.jpg") }
  end
end