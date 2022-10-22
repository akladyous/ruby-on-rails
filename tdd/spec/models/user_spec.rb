require 'debug'
require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user_attributes = ["id", "first_name", "last_name", "email", "active", "created_at", "updated_at"]
    @presence_validators = described_class.validators.select{ |v| v.instance_of?(ActiveRecord::Validations::PresenceValidator) }.map{ |v| v.attributes }
  end
  after(:all) do
    User.delete_all
  end
  context 'check model attributes' do
    ["id", "first_name", "last_name", "email", "active", "created_at", "updated_at"].each do |column|
        it "shoud include #{column.upcase} attribute" do
          expect(subject.attributes).to include(column)
        end
    end

    xit "have all required attributes" do
      expect(subject.attribute_names).to contain_exactly(*@user_attributes)
    end

    it "validate the presence of first_name" do
      subject.first_name = 'john'
      subject.validate
      expect(subject.errors).to_not include('first_name')
    end
    it "validate the presence of last_name" do
      subject.last_name = 'doe'
      subject.validate
      expect(subject.errors).to_not include('last_name')
    end
    it "validate presence of email" do
      subject.email = 'user1@gmail'
      subject.validate
      expect(subject.errors.full_messages_for(:email)).to include('Email is invalid')
    end
    it "validates email format" do
      subject.email = "user1@gmail.com"
      subject.validate
      expect(subject.errors).to_not include('email')
    end
    it 'validates email uniqueness' do
      attributes = {first_name: 'John', last_name: 'Doe', email: 'user1@gmail.com'}
      @user1 = described_class.create(attributes)
      @user2 = described_class.new(attributes)
      expect { @user2.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end
    it "should have defualt value for 'active' to be True" do
      expect(described_class.columns_hash["active"].default).to eq("1")
    end
    it "sould be kind_of Boolean for 'active' attribute" do
      expect(described_class.columns_hash["active"].type).to eq(:boolean)
    end
    it "should save successfully" do
      attributes = {first_name: 'John', last_name: 'Doe', email: 'user1@gmail.com'}
      @user = described_class.new(attributes)
      expect { @user.save }.to change(described_class, :count).by(1)
    end
  end
  context 'scope test' do
    let(:attributes) { {first_name: 'first', last_name: 'last'} }
    before(:each) do
      User.new(attributes.merge(email: 'sample1@example.com')).save
      User.new(attributes.merge(email: 'sample2@example.com')).save
      User.new(attributes.merge(email: 'sample3,@example.com', active: false)).save
      User.new(attributes.merge(email: 'sample4,@example.com', active: false)).save
    end
    it "should return active users" do
      expect(described_class.active_users.size).to be(2)
    end
    it "shoud return inactive users" do
      expect(described_class.inactive_users.size).to be(2)
    end
  end

  xdescribe "Model Assosiation" do
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

