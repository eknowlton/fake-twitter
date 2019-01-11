class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email

  has_many :followers
  has_many :following
end
