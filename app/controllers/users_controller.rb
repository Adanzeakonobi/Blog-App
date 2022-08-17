class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = if User.all.empty?
              'no user available!'
            else
              User.find(params[:id])
            end
  end
end
