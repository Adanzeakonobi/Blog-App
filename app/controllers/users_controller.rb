class UsersController < ApplicationController
  def index
    @users = User.all.order(:id)
  end

  def show
    @user = User.find(params[:id])
    # @user = if User.all.empty?
    #           'no user available!'
    #         else
    #           User.find(params[:id])
    #         end
  rescue ActiveRecord::RecordNotFound
    redirect_to action: 'index'
  end
end
