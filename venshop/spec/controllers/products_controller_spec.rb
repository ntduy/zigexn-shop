require 'rails_helper'

describe ProductsController do 
	it "renders the index teamplate" do 
		get :index
		expect(response).to render_template :index
	end
end
