require 'rails_helper'

RSpec.describe PostsController, type: :request do

    let(:author) { User.create(name: 'Adanna', photo: 'ada.png', bio: 'Public Administator.', posts_counter: 0) }
    subject(:post) { Post.create(author: author, title: 'Ada', text: 'My first post', likes_count: 0, comments_count: 0) }

    after(:example) do
        Post.destroy_all
        User.destroy_all
    end

  describe "when client displays all post from users (#index)" do

    before(:example) do
        get "/users/#{author.id}/posts"
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
    before(:example) do
        get "/users/#{author.id}/posts/#{post.id}"
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