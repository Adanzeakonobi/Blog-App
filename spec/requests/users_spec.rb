require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'when client displays all users (#index)' do
    before(:each) { get users_path }

    it 'successfully gets an index' do
      expect(response).to have_http_status(:ok)
    end

    it 'Renders the correct template' do
      expect(response).to render_template(:index)
    end

    it 'has the correct placeholder text' do
      expect(response.body).to include('here is a list of users')
    end
  end

  describe 'when client displays a single user (#show)' do
    subject(:author) { User.create(name: 'Adanna', photo: 'ada.png', bio: 'Public Administator.') }

    before(:each) { get "/users/#{author.id}" }

    it 'should return a correct (OK) status response' do
      expect(response).to have_http_status(:ok)
    end

    it 'Renders the correct template' do
      expect(response).to render_template('show')
    end

    it 'has the correct placeholder text' do
      expect(response.body).to include('show first user')
    end
  end
end
