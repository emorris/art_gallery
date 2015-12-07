FactoryGirl.define do
  factory :gallery do
    sequence(:name) {|n| "name {n}"}
    text "test the text"
  end
end