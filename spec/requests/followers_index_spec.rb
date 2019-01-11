require 'rails_helper'

RSpec.describe 'Followers Index API', type: :request do
  describe '#index' do
    it 'returns a error if the authenticated user was not found' do
      get followers_index

      expect(response).to have_http_status(:unauthorized)
    end

    it 'returns a list of users following the current user' do
      user = create(:user)
      create(:follow, is_following: user)

      get followers_index, headers: { 'Authorization': user.token }

      expect(response).to have_http_status(:success)
      followers = JSON.parse response.body
      expect(followers.count).to eq(1)
    end
  end

  def followers_index
    Rails.application.routes.url_helpers.followers_index_path
  end
end
