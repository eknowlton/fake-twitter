require 'rails_helper'

RSpec.describe 'Feeds Index API', type: :request do
  describe '#index' do
    it 'returns tweets for users the current user follows' do
      user = create(:user)

      followed_user_one = create(:user)
      create(:follow, user: user, is_following: followed_user_one)
      create(:tweet, user: followed_user_one)

      followed_user_two = create(:user)
      create(:follow, user: user, is_following: followed_user_two)
      create(:tweet, user: followed_user_two)

      get feeds_index, headers: { 'Authorization': user.token }

      expect(response).to have_http_status(:success)
      tweets = JSON.parse response.body
      expect(tweets.count).to eq(2)
    end
  end

  def feeds_index
    Rails.application.routes.url_helpers.feeds_index_path
  end
end
