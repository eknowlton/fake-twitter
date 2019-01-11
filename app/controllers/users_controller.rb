class UsersController < ApplicationController
  def index
    user = User.find(params[:id])
    render json: user.tweets.to_json(include: %i[user retweet likes])
  end
end
