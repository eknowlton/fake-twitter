require 'rails_helper'

RSpec.describe 'Follows Destroy API', type: :request do
  describe '#index' do
    it 'returns a error if the authenticated user was not found' do
      delete follows_destroy(1)

      expect(response).to have_http_status(:unauthorized)
    end

    it 'returns a list of users the curent user follows' do
      user = create(:user)
      user_to_unfollow = create(:user)
      create(:follow, user: user, is_following: user_to_unfollow)

      delete follows_destroy(user_to_unfollow.id), headers: { 'Authorization': user.token }

      expect(Follow.count).to eq(0)
      expect(response).to have_http_status(:success)
    end
  end

  def follows_destroy(id)
    Rails.application.routes.url_helpers.follows_destroy_path(id)
  end
end
