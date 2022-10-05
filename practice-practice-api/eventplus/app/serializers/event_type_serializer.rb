class EventTypeSerializer < ActiveModel::Serializer
  attributes :id, :type
  has_one :event
end
