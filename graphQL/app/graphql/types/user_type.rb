# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :first_name, String
    field :last_name, String
    field :email, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :birthdate, GraphQL::Types::ISO8601Date
    field :posts, [Types::PostType], null: trueY
    field :posts_count, Integer, null: true

    def posts_count
      object.posts.count
    end
  end
end