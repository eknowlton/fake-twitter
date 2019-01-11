class FollowSerializer < ActiveModel::Serializer
  attributes :user, :is_following
end
