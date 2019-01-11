require 'rails_helper'

RSpec.describe 'Tweets Delete API', type: :request do
  describe '#delete' do
    it 'returns a error if the authenticated user was not found' do
      tweet = create(:tweet)

      delete tweets_destroy(tweet.id)

      expect(response).to have_http_status(:unauthorized)
    end

    it 'deletes a tweet from the user' do
      user = create(:user)
      tweet = create(:tweet, user: user)

      delete tweets_destroy(tweet.id),
             headers: { 'Authorization': user.token }

      expect(response).to have_http_status(:success)
      expect(Tweet.count).to eq(0)
    end
  end

  def tweets_destroy(id)
    Rails.application.routes.url_helpers.tweets_destroy_path(id)
  end
end
