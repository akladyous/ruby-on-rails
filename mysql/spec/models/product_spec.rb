require 'rails_helper'

RSpec.describe Product, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it "match all required attributes" do
    attributes = ["id", "name", "price", "weight", "avaliable", "quantity", "department", "created_at", "updated_at"]
    expect(Product.attribute_names).to contain_exactly(*attributes)
  end
  it "match default value for #price to be Zero" do
    expect(Product.column_defaults["price"]).to eq 0.00
  end
  it "match default value for #avaliable to be 'false'" do
    expect(Product.column_defaults["avaliable"]).to be_falsy
  end

  let(:products) do
    [
      Product.create(name: 'door', price: 220.50, weight: 30, avaliable: true, quantity: 20, department: 'Home')
    ]
  end
  it "uses match_array to match a scope" do
    expect(Product.all).to match_array(products)
  end

end
