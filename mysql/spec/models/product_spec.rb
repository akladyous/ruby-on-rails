require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:column_names) { ["id", "name", "price", "weight", "avaliable", "quantity", "department", "created_at", "updated_at"] }
  # pending "add some examples to (or delete) #{__FILE__}"

  describe "Model Attributes" do
    it "match all required attributes" do
      expect(Product.attribute_names).to contain_exactly(*column_names)
    end
  end

  describe "Model defaults" do
    it "match #price value to be Zero" do
      expect(Product.column_defaults["price"]).to eq(0.00)
    end
    it "match #avaliable value to be 'false'" do
      expect(Product.column_defaults["avaliable"]).to be_falsy
    end
  end

  xdescribe "Validate Presence Of" do
    # subject.valid?
    # model_attributes = column_names.reject{ |e| e.end_with?('_at') || e=='id' }
    # [:name, :price, :weight, :avaliable, :quantity, :department].each do |attribute|
    #   it { is_expected.to validate_presence_of(attribute)}

    # end
  end

  describe "Model Collection" do
    let(:products) do
      [
        Product.create(name: 'door', price: 220.50, weight: 30, avaliable: true, quantity: 20, department: 'Home')
      ]
    end
    it "matches new product collections and Model Persistance" do
      expect(Product.all).to match_array(products)
    end
  end

end
