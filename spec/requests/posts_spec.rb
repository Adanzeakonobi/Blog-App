require 'rails_helper'

RSpec.describe PostsController, type: :request do
  # let(:author) { User.create(name: 'Adanna', photo: 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png', bio: 'Public Administator.', posts_counter: 0) }
  # subject(:post) { Post.create(author:, title: 'Ada', text: 'My first post', likes_count: 0, comments_count: 0) }

  # after(:example) do
  #   Post.destroy_all
  #   User.destroy_all
  # end

  let(:author) do
    user = User.new(name: 'Adanna', photo: 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
                    bio: 'Public Administator.', email: 'viviluv.20147@gmail.com')
    user.password = 'valido'
    user.password_confirmation = 'valido'
    user.confirm
    user
  end

  subject(:post) { Post.create(author:, title: 'Ada', text: 'My first post', likes_count: 0, comments_count: 0) }

  before(:each) do
    sign_in(author)
  end

  after(:each) do
    sign_out(author)
  end

  describe 'when client displays all post from users (#index)' do
    before(:example) do
      get "/users/#{author.id}/posts"
      # before(:example) { get user_posts_path(author.id) }
    end

    it 'successfully gets an index' do
      expect(response).to have_http_status(:ok)
    end

    it 'Renders the correct template' do
      expect(response).to render_template(:index)
    end

    it 'has the correct placeholder text' do
      expect(response.body).to include('here is a list of posts')
    end
  end

  describe 'when client displays a single user (#show)' do
    before(:example) do
      get "/users/#{author.id}/posts/#{post.id}"
    end

    it 'should return a correct (OK) status response' do
      expect(response).to have_http_status(:ok)
    end

    it 'Renders the correct template' do
      expect(response).to render_template(:show)
    end

    it 'has the correct placeholder text' do
      expect(response.body).to include('show exact post')
    end
  end
end
