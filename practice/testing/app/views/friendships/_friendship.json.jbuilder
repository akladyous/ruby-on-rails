json.extract! friendship, :id, :follower_id, :followed_id, :status, :created_at, :updated_at
json.url friendship_url(friendship, format: :json)
