class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :retweet, optional: true
  has_many :likes,
           dependent: :destroy
  has_one :retweet,
          class_name: 'Tweet',
          foreign_key: :retweet_id,
          dependent: :nullify,
          inverse_of: :original
  belongs_to :original,
             class_name: 'Tweet',
             foreign_key: :retweet_id,
             inverse_of: :retweet,
             optional: true

  validates :tweet, presence: true, length: { maximum: 255 }
  validates :user, presence: true
end
