class Like < ApplicationRecord
  belongs_to :user
  belongs_to :tweet

  validates :user, presence: true
  validates :tweet, presence: true
end
