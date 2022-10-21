require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  after(:all) do
    User.delete_all
  end
  context "GET #index" do
    it "return a success response" do
      # expect(response).to be_successful
      expect(response).to have_http_status(:success)
    end
    xit "render @index template" do
      expect(response).to render_template(:index)
    end
  end

  context "SHOW #index" do
    it "return a success response" do
      user = User.create!(first_name: "first", last_name: 'last', email: "sample@example.com")
      get :show, params: { id: user.to_param }
      expect(response).to be_successful
    end
  end
  context "NEW #index" do

  end
  context "EDIT #index" do

  end
  context "CREATE #index" do

  end
  context "UPDATE #index" do

  end
  context "DESTROY #index" do

  end
end
