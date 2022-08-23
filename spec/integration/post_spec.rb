require 'rails_helper'

RSpec.describe 'Posts', type: :integration do
  let(:author) { User.create(name: 'Adanna', photo: 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png', bio: 'Public Administator.', posts_counter: 0) }
  subject(:post) { Post.create(author:, title: 'Ada', text: 'My first post', likes_count: 0, comments_count: 0) }

  # before(:all) do
  #   Rails.application.load_seed
  # end

  after(:example) do
    Post.destroy_all
    User.destroy_all
  end

  describe 'index page:' do
    before(:example) do
      visit user_posts(author.id)
      # visit "/users/#{author.id}/posts"
    end

    it 'shows the author\'s profile picture' do
      image = page.all('img')
      expect(image.size).to eq(1)
    end

    # it 'shows the author\'s name' do
    #   expect(page).to have_content(author.name)
    # end

  end
end