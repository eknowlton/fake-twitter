class TweetSerializer < ActiveModel::Serializer
  attributes :id, :tweet

  has_one :user
  has_many :likes
  has_one :retweet
  belongs_to :original
end
