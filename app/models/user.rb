class User < ApplicationRecord
  has_many :tweets, dependent: :destroy

  has_many :is_following, class_name: 'Follow', dependent: :destroy
  has_many :following,
           class_name: 'User',
           through: :is_following,
           source: :is_following

  has_many :is_followed_by,
           class_name: 'Follow',
           foreign_key: 'is_following_id',
           dependent: :destroy,
           inverse_of: :is_following
  has_many :followers,
           class_name: 'User',
           through: :is_followed_by,
           source: :user

  has_many :likes,
           dependent: :destroy

  has_many :feed,
           class_name: 'Tweet',
           through: :following,
           source: :tweets

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :token, presence: true, length: { minimum: 10 }
end
