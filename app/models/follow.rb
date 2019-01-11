class Follow < ApplicationRecord
  belongs_to :user
  belongs_to :is_following, class_name: 'User'
end
