class User < ApplicationRecord
    has_one  :user_profiles
    has_many :user_addresses
    has_many :events
    has_one_attached :image_file, service: :amazon

    # validate :ensure_photo
    include Rails.application.routes.url_helpers

    def ensure_foto
        unless self.image_file.attached? 
            errors[:image_file] << "Photo must be attached"
        end
    end

    def is_attached?
        self.image_file.attached?
    end

    def base_uri
        user_path(self)
    end
end
