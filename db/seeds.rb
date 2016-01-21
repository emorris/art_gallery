# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(:email => "admin@example.com", :password => "password", :password_confirmation => "password") unless User.exists?

if Rails.env == "development"
	100.times.each do |i|
		NewsPost.create({ 
			title: Faker::Hipster.sentence,
			text: Faker::Hipster.paragraph(i%3),
			publish_date: Faker::Date.between(2.years.ago, Date.today)
		})
	end
end