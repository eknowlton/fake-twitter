class FeedsController < ApplicationController
  before_action :authenticate_user

  def index
    render json: current_user.feed
  end
end
