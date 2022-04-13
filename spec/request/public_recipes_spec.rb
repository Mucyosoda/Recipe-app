require 'rails_helper'

RSpec.describe 'Public Recipes controller', type: :request do
  describe 'GET /index' do
    before :each do
      get '/public_recipes'
    end
    it 'renders the right template' do
      expect(response).to render_template(:index)
    end

    it 'the response body includes the correct placeholder text' do
      expect(response.body).to include('hello from public index page')
    end

    it 'the correct response status' do
      expect(response.status).to eq(200)
    end
  end

  describe 'GET /show' do
    before :each do
      get '/public_recipes/2'
    end
    it 'renders the right template' do
      expect(response).to render_template(:show)
    end

    it 'the response body includes the correct placeholder text' do
      expect(response.body).to include('hello from public show page')
    end

    it 'the correct response status' do
      expect(response.status).to eq(200)
    end
  end
end
