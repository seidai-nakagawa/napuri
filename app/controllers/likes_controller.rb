class LikesController < ApplicationController

  before_action :set_tweet, only: [:create, :destroy]
  def create
    @like = current_user.likes.create(like_params)
    redirect_to tweet_path(@tweet)
  end

  def destroy
    @like = Like.find_by(like_params, user_id: current_user.id)
    @like.destroy
    redirect_to tweet_path(@tweet)
  end

  private
  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end
  def like_params
    params.permit(:tweet_id)
  end
end