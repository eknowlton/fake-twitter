class TweetsController < ApplicationController
  before_action :authenticate_user

  def index
    render json: current_user.tweets
  end

  def store
    tweet = Tweet.create(create_args)

    render json: tweet, status: :created
  end

  def update
    tweet = Tweet.find_by!(id: params[:id], user: current_user)
    tweet.update(tweet_params)

    render json: tweet, status: :ok
  end

  def destroy
    Tweet.find_by!(id: params[:id], user: current_user).destroy

    render status: :ok
  end

  private

  def tweet_params
    params.require(:tweet).permit(:tweet, :retweet_id).to_h.symbolize_keys
  end

  def create_args
    {
      user: current_user,
      **tweet_params
    }
  end
end
