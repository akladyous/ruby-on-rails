require_relative '20220310210246_add_style_to_products'
class RevertAddStyleToProducts < ActiveRecord::Migration[7.0]
    def change
        revert AddStyleToProducts
    end
end
