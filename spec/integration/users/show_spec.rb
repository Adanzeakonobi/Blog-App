require 'rails_helper'

RSpec.describe 'Users', type: :system do
  it 'shows the username' do
    visit('http://localhost:3000/users/3')
    expect(page).to have_content('Lilly')
  end

  it 'displays profile picture' do
    visit('http://localhost:3000/users/3')
    image = page.all('img')
    expect(image.size).to eq(1)
  end

  it 'shows numbers of posts the user has written' do
    visit('http://localhost:3000/users/2')
    expect(page).to have_content('Number of posts: 4')
  end

  it 'shows the user\'s bio' do
    visit('http://localhost:3000/users/1')
    expect(page).to have_content('Teacher from Mexico.')
  end

  it 'shows the user\'s first 3 posts' do
    visit('http://localhost:3000/users/2')
    expect(page).to have_content('Hello 4')
    expect(page).to have_content('Hello 3')
    expect(page).to have_content('Hello 2')
  end

  it 'has a "See all posts" button' do
    visit('http://localhost:3000/users/2')
    expect(page).to have_selector(:link_or_button, 'See all posts')
  end

  it 'redirects to the user/post/show page when clicking on a post' do
    visit('http://localhost:3000/users/2')
    expect(page).to have_link('Hello 3', href: '/users/2/posts/3')
  end

  it 'redirects to users/posts index when clicking in "See all posts"' do
    visit('http://localhost:3000/users/1')
    expect(page).to have_link('', href: '/users/1/posts')
  end
end
