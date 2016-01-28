# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(:email => "admin@example.com", :password => "password", :password_confirmation => "password") unless User.exists?

if Rails.env == "development"
	unless Artist.exists?
		7.times.each do |i|
			Artist.create({
				name: Faker::Hipster.words(3).join(" "),
				bio: Faker::Hipster.paragraph(10)
			})
		end
	end

	Picture.all.each do |picture|
		picture.title =  Faker::Hipster.sentence
		picture.text = Faker::Hipster.paragraph(7)
		picture.save
	end

	unless Gallery.exists?
		3.times.each do |i|
			gallery = Gallery.create({
				name: Faker::Hipster.words(3).join(" "),
				text: Faker::Hipster.paragraph(70)
			})
			5.times.each do |i|
				gallery.shows << Show.create({
						title: Faker::Hipster.sentence,
						text: Faker::Hipster.paragraph(30),
						artists: Faker::Hipster.paragraph(50),
						start_date: (i -1).weeks.ago,
						end_date: (i -2).weeks.ago - 1.day,
						reception_start: i.weeks.ago,
						reception_end: i.weeks.ago + 2.hours,
						visible: true
					})
			end
		end
	end

	unless NewsPost.exists?
		100.times.each do |i|
			NewsPost.create({ 
				title: Faker::Hipster.sentence,
				text: Faker::Hipster.paragraph(50),
				publish_date: Faker::Date.between(2.years.ago, Date.today)
			})
		end
	end
end