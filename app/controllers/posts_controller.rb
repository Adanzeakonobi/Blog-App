class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    # @post = if Post.all.empty?
    #           'no post available!'
    #         else
    #           Post.find(params[:id])
    #         end
  end
end
