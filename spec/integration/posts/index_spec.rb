require 'rails_helper'

RSpec.describe 'Post', type: :system do
it 'shows the username' do
    visit('http://localhost:3000/users/2/posts')
    expect(page).to have_content('Lilly')
  end

  it 'displays profile picture' do
    visit('http://localhost:3000/users/2/posts')
    image = page.all('img')
    expect(image.size).to eq(1)
  end

  it 'shows numbers of posts the user has written' do
    visit('http://localhost:3000/users/2/posts')
    expect(page).to have_content('Number of posts: 4')
  end

  it 'shows posts title' do
    visit('http://localhost:3000/users/2/posts')
    expect(page).to have_content('Hello 4')
  end

  it 'shows posts body' do
    visit('http://localhost:3000/users/2/posts')
    expect(page).to have_content('This is my fourth post...')
  end

  it 'shows the firsts comments on a post' do
    visit('http://localhost:3000/users/2/posts')
    expect(page).to have_content('Hi Tom 6!')
    expect(page).to have_content('Hi Tom 5!')
    expect(page).to have_content('Hi Tom 4!')
  end

  it 'shows the number of comments of a post' do
    visit('http://localhost:3000/users/2/posts')
    expect(page).to have_content('Comments: 6')
  end

  it 'shows the number of likes of a post' do
    visit('http://localhost:3000/users/2/posts')
    expect(page).to have_content('Likes: 1')
  end

  it 'has a pagination' do
    visit('http://localhost:3000/users/2/posts')
    expect(page).to have_content('Pagination')
  end

  it 'redirects to the user/post/show page when clicking on a post' do
    visit('http://localhost:3000/users/2/posts')
    expect(page).to have_link('Hello 4', href: '/users/2/posts/4')
  end
end