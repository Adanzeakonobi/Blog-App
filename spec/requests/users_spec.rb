require 'rails_helper'

RSpec.describe UsersController, type: :request do
  subject(:author) do
    user = User.new(name: 'Adanna', photo: 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
                    bio: 'Public Administator.', email: 'viviluv.20147@gmail.com')
    user.password = 'valido'
    user.password_confirmation = 'valido'
    user.confirm
    user
  end

  before(:each) do
    sign_in(author)
  end

  after(:each) do
    sign_out(author)
  end

  describe 'when client displays all users (#index)' do
    before(:each) { get users_path }

    it 'successfully gets an index' do
      expect(response).to have_http_status(:ok)
    end

    it 'Renders the correct template' do
      expect(response).to render_template(:index)
    end

    it 'has the correct placeholder text' do
      expect(response.body).to include('Here is a list of Users')
    end
  end

  describe 'when client displays a single user (#show)' do
    # subject(:author) { User.create(name: 'Adanna', photo: 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png', bio: 'Public Administator.') }

    before(:each) { get "/users/#{author.id}" }

    it 'should return a correct (OK) status response' do
      expect(response).to have_http_status(:ok)
    end

    it 'Renders the correct template' do
      expect(response).to render_template('show')
    end

    it 'has the correct placeholder text' do
      expect(response.body).to include('Show exact User')
    end
  end
end
