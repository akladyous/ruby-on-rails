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
require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
