require 'faker' 
FactoryGirl.define do 
	factory :user do |u| 
		u.name { Faker::Name.first_name } 
		u.email { Faker::Internet.email } 
	end 
end