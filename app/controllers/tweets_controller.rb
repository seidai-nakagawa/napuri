class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]
 
  def index
    # @tweets = Tweet.includes(:user).order("created_at DESC")
    @tweets = Tweet.all.order('created_at ASC')
  end

  def new
    @tweet = Tweet.new
    @tweet.images.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      flash.now[:alert] = 'エラー : 必須項目を入力してください。'
      render :new
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy    
  end

  def edit
    @tweet.images.new
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
  end

  def show
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
  end

  private
  def tweet_params
    params.require(:tweet).permit(:video, :text, :title, images_attributes: [:url, :_destroy, :id]).merge(user_id: current_user.id)
  end
  def set_tweet
    @tweet = Tweet.find(params[:id])
    @images = @tweet.images
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
