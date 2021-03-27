class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :books, :reviews
end
