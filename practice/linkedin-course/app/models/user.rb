# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  active     :boolean          default(TRUE)
#  email      :string
#  first_name :string
#  last_name  :string
#  role       :integer          default("user")
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :integer          not null
#
# Indexes
#
#  index_users_on_company_id                         (company_id)
#  index_users_on_email_and_company_id_and_username  (email,company_id,username) UNIQUE
#
# Foreign Keys
#
#  company_id  (company_id => companies.id)
#
class User < ApplicationRecord
    belongs_to :company
    belongs_to :active_users, -> { select(:id, :active) }, class_name: "User", optional: true

    #guest user manager admin
    # 0    1    2       3 
    enum role: {user: 0, admin: 1, manager: 2, guest: 3}

    scope :active_admin,    -> { admin.where(active: true) }
    scope :active_user,     -> { user.where(active: true) }

    delegate :name, to: :company, prefix: true, allow_nil: true
end
