class EventCategorySerializer < ActiveModel::Serializer
  attributes :id, :category
  has_one :event
end
