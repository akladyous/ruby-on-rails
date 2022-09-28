class UserAddressSerializer < ActiveModel::Serializer
  attributes :id, :address, :addres_2, :city, :state, :zip, :country
  has_one :user
end
