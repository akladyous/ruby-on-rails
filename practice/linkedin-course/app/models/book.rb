# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  author     :string
#  category   :string
#  pages      :integer
#  price      :decimal(5, 2)
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Book < ApplicationRecord
end
