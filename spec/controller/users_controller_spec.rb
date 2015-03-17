require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  let(:user) {FactoryGirl.create(:user)}
  describe "GET create" do
    it "should create a user" do
      user_params = {
        user: {
          user_name: "Kavya H S",
          email: "kavya@gmail.com",
          organization: "qwinix",
          designation: "developer"
        }
      }
      expect do
        post :create, user_params
      end.to change(User, :count).by(1)
    end
  end
end