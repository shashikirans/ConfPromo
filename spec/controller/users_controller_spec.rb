require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  let(:user) {FactoryGirl.create(:user)}
  describe "GET create" do
    it "should create a user" do
      user_params = {
        user: {
          user_name: "my name",
          email: "address@gmail.com",
          organization: "company name",
          designation: "developer"
        }
      }
      expect do
        post :create, user_params
      end.to change(User, :count).by(1)
      expect(response.status).to eq(302)
    end
    it "should not create a user" do
      user_params = {
        user: {}
      }
      expect(response.status).to eq(200)
    end
  end
end