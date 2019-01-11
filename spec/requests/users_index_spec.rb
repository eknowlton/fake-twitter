require 'rails_helper'

RSpec.describe 'Users Index API', type: :request do
  describe '#index' do
    it 'returns a list of tweets by the specified user' do
      user = create(:user)
      create(:tweet, user: user)

      get users_index(user.id)

      expect(response).to have_http_status(:success)
      expect(response.body).to eq(user.tweets.to_json)
    end
  end

  def users_index(id)
    Rails.application.routes.url_helpers.users_index_path(id)
  end
end
