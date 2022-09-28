class UrlSerializer < ActiveModel::Serializer
    # has_many :clicks, only: [:id, :browser, :platform]
    # attributes :created_at, :id
    attributes :data
    
    # def children
    #     object.children
    # end
    def clicks
        ActiveModel::SerializableResource.new(object.clicks,  each_serializer: ClickSerializer)
    end
    def data
        type = [
            {
                type: "ruls",
                id: object.id,
                attributes: {
                    created_at: object.created_at,
                    original_url: object.original_url,
                    url: "#{object.original_url}/#{object.short_url}",
                    clicks: object.clicks_count
                }
            },
            relationships: {
                clicks: {
                    data: [
                        {
                            clicks
                        }
                    ]
                }
            }

        ]
    end
end
