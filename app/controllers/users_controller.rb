class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @tweets = Tweet.includes(:user).order("created_at DESC")
  end
end
