require "rails_helper"

Rails.application.routes.draw do
  get "/example" => redirect("http://example.com")
end

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
end

# Due to limitations in the Rails routing test framework, routes that
# perform redirects must actually be tested via request specs
RSpec.describe "/example", :type => :request do
  it "redirects to example.com" do
    get "/example"
    expect(response).to redirect_to("http://example.com")
  end
end