require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Post validations' do
    # let(:author) { User.create(name: 'Romy', bio: 'Public Administator') }

    let(:author) do
      user = User.new(name: 'Romy', photo: 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
                      bio: 'Public Administator.', email: 'viviluv.20147@gmail.com')
      user.password = 'valido'
      user.password_confirmation = 'valido'
      user.confirm
      user
    end

    subject(:post) { Post.create(author:, title: 'my first post', text: 'My name is Ada') }

    after(:all) do
      Post.destroy_all
      User.destroy_all
    end

    it 'Title should be present' do
      post.title = nil
      expect(post).to_not be_valid
    end

    it 'Title should not be greater than 250 characters' do
      post.title = 'b' * 280
      expect(post).to_not be_valid
    end

    it 'Comments count should be integer' do
      post.comments_count = 'Sam'
      expect(post).to_not be_valid
    end

    it 'Comments count should be greater than or equal to 0' do
      post.comments_count = -1
      expect(post).to_not be_valid
    end

    it 'Likes counter should be greater than or equal to 0' do
      post.likes_count = -1
      expect(post).to_not be_valid
    end

    it 'Likes counter should be integer' do
      post.likes_count = 2.2
      expect(post).to_not be_valid
    end
  end
end