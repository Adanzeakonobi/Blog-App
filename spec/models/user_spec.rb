require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User validations' do
    subject { User.new(name: 'Ada', photo: 'ada.png', bio: 'Student.', posts_counter: 0) }

    before { subject.save }

    it 'Check name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'User should have post greater than or equal to 0' do
      subject.posts_counter = 1
      expect(subject).to be_valid
    end

    it 'posts_counter should be integer' do
      subject.posts_counter = 'text'
      expect(subject).to_not be_valid
    end
  end

  describe 'Should test recent post method' do
    before { 4.times { |_post| Post.create(author: subject, title: 'my first post') } }

    it 'User should have three recent posts' do
      expect(subject.most_recent_posts).to eq(subject.posts.last(3))
    end
  end
end
