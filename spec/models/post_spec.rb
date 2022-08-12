require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Post validations' do
    user = User.create(name: 'Romy', bio: 'Public Administator', posts_counter: 0)
    subject { Post.new(author: user, title: 'my first post', text: 'My name is Ada') }

    before { subject.save }

    it 'Title should be present' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'Title should not be greater than 250 characters' do
        subject.title = 'b' * 280
      expect(subject).to_not be_valid
    end

    it 'Comments count should be integer' do
      subject.comments_count = 2
      expect(subject).to be_valid
    end

    it 'Comments count should be greater than or equal to 0' do
      subject.comments_count = -1
      expect(subject).to_not be_valid
    end

    it 'Likes counter should be greater than or equal to 0' do
      subject.likes_count = -1
      expect(subject).to_not be_valid
    end

    it 'Likes counter should be integer' do
      subject.likes_count = 2.2
      expect(subject).to_not be_valid
    end
  end
end