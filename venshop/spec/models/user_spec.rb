require 'rails_helper'

describe User do
	before do
		@user = User.new(name: "test", email: "test@te.com", phone: "0903321123", password: "123456", password_confirmation: "123456")
	end
	it "has a invalid user" do
		user = User.create
		expect(user).to_not be_valid
	end

	it "has a invalid email of user" do
		user = User.create(name: "test", email: "test@test")
		expect(user).to_not be_valid
	end	

	it "has a valid user" do	
		expect(@user).to be_valid
	end	

	it "password doesn't match password_confirmation" do
		@user.password_confirmation = "123"
		expect(@user).to_not be_valid
	end	

	it "has a valid factory" do
		expect(build(:user, phone: "0903321123", password: "123456", password_confirmation: "123456")).to be_valid
	end

	it "is invalid without a firstname" do
		contact = FactoryGirl.build(:user, name: nil)
		expect(contact).to_not be_valid
	end
end