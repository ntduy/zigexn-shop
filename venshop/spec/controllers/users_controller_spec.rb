require 'rails_helper'

describe UsersController do
	# it "assigns @users" do
	# 	user = create(:user, name: "test", email: "test@test.com", phone: "0903321123", password: "123456", password_confirmation: "123456")
	# 	get :index
	# 	expect(assigns(@users)).to match_array [user]
	# end

	it "renders the index teamplate" do
		get :index
		expect(response).to render_template :index
	end

	it "assigns the requested user" do
		user1= create(:user, name: "test", email: "test@test.com", phone: "0903321123", password: "123456", password_confirmation: "123456")
		get :show, id: user1.id
		expect(assigns(user1)).to eq user1
	end
end
