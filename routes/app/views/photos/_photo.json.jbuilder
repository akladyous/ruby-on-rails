json.extract! photo, :id, :link, :user_id, :created_at, :updated_at
json.url photo_url(photo, format: :json)
