require 'rails_helper'

RSpec.describe PostsController, type: :request do
    # user = User.create(name: 'Adanna', photo: 'ada.png', bio: 'Public Administator.')

    let(:author) { User.create(name: 'Adanna', photo: 'ada.png', bio: 'Public Administator.') }
    subject(:post) { Post.create(author: user, title: 'Ada', text: 'My first post') }

    after(:example) do
        Post.destroy_all
        User.destroy_all
    end

  describe "when client displays all post from users (#index)" do
    # before(:each) { get "/users/#{user.id}/posts" }

    before(:example) do 
        get "#{users_path}/#{author.id}/posts"
    end

    it "successfully gets an index" do
      expect(response).to have_http_status(:ok)
    end

    it "Renders the correct template" do
      expect(response).to render_template(:index)
    end

    it "has the correct placeholder text" do
      expect(response.body).to include("here is a list of posts")
    end
  end

  describe "when client displays a single user (#show)" do
    # post = Post.create(author: user, title: 'Ada', text: 'My first post')

    # before(:each) { get "/users/#{user.id}/posts/#{post.id}" }
    before(:example) do
        get "#{users_path}/#{author.id}/posts/#{post.id}"
      end

    it "should return a correct (OK) status response" do
      expect(response).to have_http_status(:ok)
    end

    it "Renders the correct template" do
      expect(response).to render_template(:show)
    end

    it "has the correct placeholder text" do
      expect(response.body).to include("show first post")
    end
  end
end