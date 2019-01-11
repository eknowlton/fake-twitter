require 'rails_helper'

RSpec.describe 'Follows Index API', type: :request do
  describe '#index' do
    it 'returns a error if the authenticated user was not found' do
      get follows_index

      expect(response).to have_http_status(:unauthorized)
    end

    it 'returns a list of users the curent user follows' do
      user = create(:user)
      create(:follow, user: user)

      get follows_index, headers: { 'Authorization': user.token }

      expect(response).to have_http_status(:success)
      following = JSON.parse response.body
      expect(following.count).to eq(1)
    end
  end

  def follows_index
    Rails.application.routes.url_helpers.follows_index_path
  end
end
