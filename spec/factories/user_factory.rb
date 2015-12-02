FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@testtest.com"}
    password "password"
  end
end