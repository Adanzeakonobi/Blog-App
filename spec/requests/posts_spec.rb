require 'rails_helper'

RSpec.describe 'Posts', type: :request do
    it "assigns all posts to @posts" do
     get posts_path
     expect(assigns(:posts)).to eq(Post.all)
    end
end
