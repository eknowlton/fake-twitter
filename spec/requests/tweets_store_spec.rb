require 'rails_helper'

RSpec.describe 'Tweets Create API', type: :request do
  describe '#store' do
    it 'returns a error if the user was not found' do
      post tweets_store

      expect(response).to have_http_status(:unauthorized)
    end

    it 'creates a tweet from the user' do
      user = create(:user)
      retweet = create(:tweet)

      post tweets_store,
           params: { 'tweet': { 'tweet': 'This is a new tweet', 'retweet_id': retweet.id } },
           headers: { 'Authorization': user.token }

      expect(response).to have_http_status(:created)
      expect(response.body).to eq(user.tweets.first.to_json)
    end
  end

  def tweets_store
    Rails.application.routes.url_helpers.tweets_store_path
  end
end
