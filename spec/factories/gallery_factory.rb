FactoryGirl.define do
  factory :gallery do
    sequence(:name) {|n| "name #{n}"}
    text "test the text"
    pictures {[FactoryGirl.create(:picture)]}
  end
end