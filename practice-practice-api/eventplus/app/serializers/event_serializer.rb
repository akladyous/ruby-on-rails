class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :organizer, :location, :start_date, :end_date, :start_time, :end_time, :display_start_time, :display_end_time, :time_zone
  has_one :user
end
