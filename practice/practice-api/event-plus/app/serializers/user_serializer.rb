class UserSerializer < ActiveModel::Serializer
    # ActiveModelSerializers.config.default_includes = '**'
    attributes :id, :user_name, :email, :password, :image_url
    # attribute :image_url, if: ->{ include_image_url? }

    has_one :user_profile
    
    def include_image_url?
        object.is_attached?
    end

    def image_url
        # byebug
        if object.is_attached?
            Rails.application.routes.url_helpers.rails_blob_url(self.object.image_file.blob, only_path: true)
        else
            nil
        end
    end
end
