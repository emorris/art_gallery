FactoryGirl.define do
  factory :show do
    sequence(:title) {|n| "Title #{n}"}
    sequence(:text) {|n| "Text #{n}"}
  end
end