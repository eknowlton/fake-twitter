require 'rails_helper'

RSpec.describe 'Tweets Index API', type: :request do
  describe '#index' do
    it 'returns a error if the authenticated user was not found' do
      get tweets_index

      expect(response).to have_http_status(:unauthorized)
    end

    it 'returns a list of tweets by the current user' do
      user = create(:user)
      create(:tweet, user: user)

      get tweets_index, headers: { 'Authorization': user.token }

      expect(response).to have_http_status(:success)
      expect(response.body).to eq(user.tweets.to_json)
    end
  end

  def tweets_index(id = nil)
    Rails.application.routes.url_helpers.tweets_index_path(id)
  end
end
