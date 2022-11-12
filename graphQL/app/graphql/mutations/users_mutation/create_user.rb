module Mutations
  module UsersMutation
    class CreateUser < Mutations::BaseMutation

      argument :first_name, String, required: true
      argument :last_name, String, required: true
      argument :email, String, required: true
      argument :birthdate, GraphQL::Types::ISO8601Date, required: true

      field :user, Types::UserType, null: false
      field :errors, [String], null: false

      def resolve(first_name:, last_name:, email:, birthdate:)
        user = User.new(first_name: first_name, last_name: last_name, email: email, birthdate: birthdate)
        if user.save
          { user: user, errors: [] }
        else
          { user: nil, errors: user.errors.full_messages }
        end
      end
    end

  end
end
