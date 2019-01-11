FactoryBot.define do
  factory :follow do
    user
    is_following { create(:user) }
  end
end
