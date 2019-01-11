require 'rails_helper'

RSpec.describe 'Tweets Update API', type: :request do
  describe '#index' do
    it 'returns a error if the authenticated user was not found' do
      tweet = create(:tweet)

      patch tweets_update(tweet.id)

      expect(response).to have_http_status(:unauthorized)
    end

    it 'updates the tweet for a user' do
      user = create(:user)
      tweet = create(:tweet, user: user)

      patch tweets_update(tweet.id),
            params: { 'tweet': { 'tweet': 'New Updated tweet... :/' } },
            headers: { 'Authorization': user.token }

      tweet.reload
      expect(response).to have_http_status(:success)
      expect(response.body).to eq(user.tweets.first.to_json)
    end
  end

  def tweets_update(id)
    Rails.application.routes.url_helpers.tweets_update_path(id)
  end
end
