require 'rails_helper'

RSpec.describe 'Likes Destroy API', type: :request do
  describe '#destroy' do
    it 'returns a error if the user was not found' do
      user_to_follow = create(:user)

      delete likes_destroy(user_to_follow.id)

      expect(response).to have_http_status(:unauthorized)
    end

    it 'creates a like for a tweet' do
      user = create(:user)
      tweet = create(:tweet)
      create(:like, user: user, tweet: tweet)

      delete likes_destroy(tweet.id), headers: { 'Authorization': user.token }

      user.reload
      expect(response).to have_http_status(:success)
      expect(user.likes.count).to eq(0)
    end
  end

  def likes_destroy(id)
    Rails.application.routes.url_helpers.likes_destroy_path(id)
  end
end
