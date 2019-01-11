require 'rails_helper'

RSpec.describe 'Follows Store API', type: :request do
  describe '#store' do
    it 'returns a error if the authenticated user was not found' do
      user_to_follow = create(:user)

      post follows_store(user_to_follow.id)

      expect(response).to have_http_status(:unauthorized)
    end

    it 'follows a user' do
      user = create(:user)
      user_to_follow = create(:user)

      post follows_store(user_to_follow.id), headers: { 'Authorization': user.token }

      expect(response).to have_http_status(:success)
      following = JSON.parse response.body
      expect(following.first).to include('id' => user_to_follow.id)
    end
  end

  def follows_store(id)
    Rails.application.routes.url_helpers.follows_store_path(id)
  end
end
