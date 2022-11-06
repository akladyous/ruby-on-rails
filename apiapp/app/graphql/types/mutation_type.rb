module Types
  class MutationType < Types::BaseObject

    field :create_user, mutation: Mutations::UsersMutation::CreateUser

  end
end
