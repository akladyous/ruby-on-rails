require 'rails_helper'
require 'debug'

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
    before(:each) { get :index }
    let(:users) { User.all }

    it "return a success response" do
      # expect(response).to be_successful
      expect(response).to have_http_status(:success)
    end
    it "assigns all users to @users" do
      expect(assigns['users']).to eq(users)
    end
    it "render @index template" do
      expect(response).to render_template('index')
    end
  end

  context "GET #show" do
    let(:user_one) { User.first }

    it "return a success response" do
      get :show, params: { id: user_one.to_param }
      expect(response).to be_successful
    end

    it "render @show template" do
      get :show, params: { id: user_one.to_param }
      expect(response).to render_template(:show)
      # parsed_body = JSON.parse(response.body)
      # expect(response.body).to include(user_one.first_name)
    end

    it "parse user attributes on #show template" do
      get :show, params: { id: user_one.to_param }
      expect(response.body).to include(user_one.first_name)
      expect(response.body).to include(user_one.last_name)
      expect(response.body).to include(user_one.email)
    end

  end
  context "NEW #index" do
    it "render @new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end
  context "PUT #edit" do

  end
  context "POST #creaet" do

  end
  context "UPDATE #index" do

  end
  context "DESTROY #index" do

  end
end
