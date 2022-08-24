require 'rails_helper'

RSpec.describe 'Post', type: :system do
it 'shows the names of the users' do
    visit('http://localhost:3000/')
    expect(page).to have_content('Lilly')
    expect(page).to have_content('ada')
    expect(page).to have_content('Tom')
  end

  it 'displays image of each user' do
    visit('http://localhost:3000/')
    image = page.all('img')
    expect(image.size).to eq(3)
  end

  it 'shows numbers of posts of each user' do
    visit('http://localhost:3000/')
    expect(page).to have_content('Number of posts: 0')
    expect(page).to have_content('Number of posts: 4')
    expect(page).to have_content('Number of posts: 0')
  end

  it 'redirects to the user/show page' do
    visit('http://localhost:3000/')
    expect(page).to have_link('Lilly', href: '/users/3')
  end
end