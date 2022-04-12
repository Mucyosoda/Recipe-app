require "rails_helper"

RSpec.describe "Foods controller", type: :request do
  describe "GET /index" do
    before :each do
      get "/foods"
    end
    it "renders the right template" do
      expect(response).to render_template(:index)
    end

    it "the response body includes the correct placeholder text" do
      expect(response.body).to include("hello from foods index page")
    end

    it "the correct response status" do
      expect(response.status).to eq(200)
    end
  end
end
