require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  render_views
  after(:all) do
    User.delete_all
  end
  context "GET #index" do
    before(:all) do
      User.create!(first_name: "first", last_name: 'last', email: "sample1@example.com")
      User.create!(first_name: "first", last_name: 'last', email: "sample2@example.com")
      User.create!(first_name: "first", last_name: 'last', email: "sample3@example.com")
    end
    let(:users) { User.all }

    it "return a success response" do
      # expect(response).to be_successful
      expect(response).to have_http_status(:success)
    end
    it "assigns all users to @users" do
      get :index
      expect(assigns['users']).to eq(users)
    end
    it "render @index template" do
      get :index
      expect(response).to render_template('index')
    end
  end

  context "GET #show" do
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
