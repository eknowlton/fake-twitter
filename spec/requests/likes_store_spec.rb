require 'rails_helper'

RSpec.describe 'Likes Store API', type: :request do
  describe '#store' do
    it 'returns a error if the user was not found' do
      user_to_follow = create(:user)

      post likes_store(user_to_follow.id)

      expect(response).to have_http_status(:unauthorized)
    end

    it 'creates a like for a tweet' do
      user = create(:user)
      tweet = create(:tweet)

      post likes_store(tweet.id), headers: { 'Authorization': user.token }

      user.reload
      expect(response).to have_http_status(:success)
      expect(user.likes.count).to eq(1)
    end
  end

  def likes_store(id)
    Rails.application.routes.url_helpers.likes_store_path(id)
  end
end
