class LikesController < ApplicationController
  before_action :authenticate_user

  def store
    tweet = Tweet.find(params[:id])
    Like.create(user: current_user, tweet: tweet)

    render status: :ok
  end

  def destroy
    tweet = Tweet.find(params[:id])
    Like.find_by!(user: current_user, tweet: tweet).destroy
  end
end
