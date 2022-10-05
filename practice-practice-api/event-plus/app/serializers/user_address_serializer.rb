class UserAddressSerializer < ActiveModel::Serializer
  attributes :id, :address, :address_2, :city, :state, :zip, :country
  has_one :user_profile
end
