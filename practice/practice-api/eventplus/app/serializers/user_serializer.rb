class UserSerializer < ActiveModel::Serializer
    attributes :id, :user_name, :email, :password, :image_url
    # attribute :image_url, if: ->{ include_image_url? }

    
    def include_image_url?
        scope.is_attached?
    end

    def image_url
        if scope.is_attached?
            Rails.application.routes.url_helpers.rails_blob_url(self.object.image_file.blob, only_path: true)
        else
            nil
        end
    end
end
