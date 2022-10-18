require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Model Assosiation" do
    it "has_many orders" do
      assc = User.reflect_on_association(:orders)
      expect(assc.macro).to eq(:has_many)
    end
    it "has_many photos" do
      assc = User.reflect_on_association(:photos)
      expect(assc.macro).to eq(:has_many)
    end
    it "has_many comments" do
      assc = User.reflect_on_association(:comments)
      expect(assc.macro).to eq(:has_many)
    end
    it "has_one address" do
      assc = User.reflect_on_association(:address)
      expect(assc.macro).to eq(:has_one)
    end
  end
end
