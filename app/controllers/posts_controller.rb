class PostsController < ApplicationController
  def index
    # @posts = Post.all
    @user = User.find(params[:user_id])
    @posts = @user.posts.order(id: :desc)
  rescue ActiveRecord::RecordNotFound
    redirect_to users_path
  end

  def show
    @post = Post.find(params[:id])
    # @post = if Post.all.empty?
    #           'no post available!'
    #         else
    #           Post.find(params[:id])
    #         end
  rescue ActiveRecord::RecordNotFound
    redirect_to action: 'index'
  end
end
