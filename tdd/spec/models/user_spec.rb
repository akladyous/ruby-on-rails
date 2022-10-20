require 'debug'
require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Check model Attributes" do
    ["id", "first_name", "last_name", "email", "active", "created_at", "updated_at"].each do |column|
        it "shoud include the #{column} attribute" do
          expect(subject.attributes).to include(column)
        end
    end
  end
end
