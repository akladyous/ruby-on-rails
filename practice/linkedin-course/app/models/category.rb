# == Schema Information
#
# Table name: categories
#
#  id             :integer          not null, primary key
#  name           :string
#  products_count :integer          default(0)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Category < ApplicationRecord
    has_many :products, dependent: :destroy
    has_many :active_products, dependent: :destroy, class_name: "Product"

    # scope :with_active_products, -> {
    #     includes(:products)
    #     .select("products.status")
    #     .where(products: {status: :active})
    # }

    scope :with_active_products, -> {
        includes(:active_products)
        .where(products: {status: :active})
    }
end
