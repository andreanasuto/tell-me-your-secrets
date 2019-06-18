class SecretSerializer < ActiveModel::Serializer
  attributes :id, :sentence, :user, :location
end
