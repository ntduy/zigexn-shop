# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name:  "ntduy",
	email: "example@railstutorial.org",
	password:              "123456",
	password_confirmation: "123456",
	admin: true,
	activated: true,
	activated_at: Time.zone.now)

9.times do |n|
	name  = "testpage-#{n+1}"
	email = "example-#{n+1}@railstutorial.org"
	password = "password"
	User.create!(name:  name,
		email: email,
		password: password,
		password_confirmation: password,
		activated: true,
		activated_at: Time.zone.now)
end

users = User.order(:created_at).take(5)
15.times do |n|
  content = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. ----- #{n+1}"
  users.each { |user| user.microposts.create!(content: content) }
end