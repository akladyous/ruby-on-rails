class EventTagSerializer < ActiveModel::Serializer
  attributes :id, :tag
  has_one :event
end
