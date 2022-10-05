# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  color       :string
#  name        :string
#  qty         :integer
#  sold        :boolean
#  status      :integer          default("active")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer          not null
#
# Indexes
#
#  index_products_on_category_id  (category_id)
#
# Foreign Keys
#
#  category_id  (category_id => categories.id)
#
class Product < ApplicationRecord
    belongs_to :category, touch: true, counter_cache: true
    belongs_to :active_products, -> { select(:id, :status) }, class_name: "Product", optional: true

    delegate :name, to: :category, prefix: true, allow_nil: true

    enum status: {active: 0, inactive: 1, out_of_date: 2, in_progress: 3}
end
