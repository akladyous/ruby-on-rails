class Product < ApplicationRecord
  validates :name, :price, :weight, :avaliable, :quantity, :department, presence: true

end
