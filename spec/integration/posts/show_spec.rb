require 'rails_helper'

RSpec.describe 'Post', type: :system do
  it 'shows the post title' do
    visit('http://localhost:3000/users/2/posts')
    expect(page).to have_content('Hello 3')
  end

  it 'displays who wrote the post' do
    visit('http://localhost:3000/users/2/posts')
    expect(page).to have_content('Tom')
  end

  it 'shows how many comments the post has' do
    visit('http://localhost:3000/users/2/posts')
    expect(page).to have_content('Comments: 6')
  end

  it 'shows how many likes the post has' do
    visit('http://localhost:3000/users/2/posts/3')
    expect(page).to have_content('Likes: 1')
  end

  it 'shows posts body' do
    visit('http://localhost:3000/users/2/posts/3')
    expect(page).to have_content('Hello 3')
  end

  it 'shows the names of each commentor' do
    visit('http://localhost:3000/users/2/posts/3')
    expect(page).to have_content('Lilly')
    # expect(page).to have_content('Josh')
  end

  it 'shows the comments the post has' do
    visit('http://localhost:3000/users/2/posts/3')
    expect(page).to have_content('Hi Tom 6!')
    expect(page).to have_content('Hi Tom 5!')
    expect(page).to have_content('Hi Tom 4!')
  end
end