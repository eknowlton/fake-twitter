FactoryBot.define do
  factory :tweet do
    tweet { Faker::Lorem.sentence(3) }
    user
  end
end
