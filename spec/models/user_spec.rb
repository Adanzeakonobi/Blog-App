require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User validations' do
    subject(:author) { User.create(name: 'Ada', photo: 'ada.png', bio: 'Student.') }

    after(:all) {User.destroy_all}

    it 'Check name should be present' do
      author.name = nil
      expect(author).to_not be_valid
    end

    it 'User should have post greater than or equal to 0' do
      author.posts_counter = 1
      expect(author).to be_valid
    end

    it 'posts_counter should be integer' do
      author.posts_counter = 'text'
      expect(author).to_not be_valid
    end

    describe 'Should test recent post method' do
      before { 4.times { |_post| Post.create(author:, title: 'my first post') } }
  
      it 'User should have three recent posts' do
        expect(author.most_recent_posts.length).to eq 3
      end
    end
  end
end
