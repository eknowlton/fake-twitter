class FollowersController < ApplicationController
  before_action :authenticate_user

  def index
    render json: current_user.followers
  end
end
