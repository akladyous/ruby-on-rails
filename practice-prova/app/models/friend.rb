class Friend < ApplicationRecord
  after_create_commit -> { broadcast_append_to "friends_channel", target: 'friend' }
end
