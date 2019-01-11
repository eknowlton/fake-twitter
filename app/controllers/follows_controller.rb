class FollowsController < ApplicationController
  before_action :authenticate_user

  def index
    render json: current_user.following
  end

  def store
    user_to_follow = User.find(params[:id])
    Follow.create(user: current_user, is_following: user_to_follow)

    render json: current_user.following
  end

  def destroy
    Follow.find_by(user: current_user, is_following: User.find(params[:id])).destroy
  end
end
