FactoryGirl.define do
  factory :news_post do
    sequence(:title) {|n| "Title #{n}"}
    sequence(:text) {|n| "Text #{n}"}
  end
end