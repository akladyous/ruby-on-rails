# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  founded_on :date
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Company < ApplicationRecord
    has_many :users, dependent: :destroy
    has_many :active_users, dependent: :destroy, class_name: "User"

    # company = Company.first
    # users = company.users
    # Company.include(:users).select(users: :active).where(users: {active: true})

    # def self.with_active_users
    #     self.include(:users).select(users: :active).where(users: {active: true})
    # end

    # scope :with_active_users, -> {
    #     includes(:users)
    #         .select("users.active")
    #         .where(users: {active: true})
    # }
    scope :with_active_users, -> {
        includes(:active_users)
            .where(users: {active: true})
    }
end
