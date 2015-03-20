require 'rails_helper'
RSpec.describe User, :type => :model do
  let(:user) {FactoryGirl.create(:user)}

  context "Factory settings for users" do

    it "should validate the user factories" do
      expect(FactoryGirl.build(:user).valid?).to be true
    end
  end

  describe User do
    it { should validate_presence_of :user_name }
    it { should validate_presence_of :email}
    it { should validate_presence_of :organization}
    it { should validate_presence_of :designation}
  end

  it "should validate email as true" do
    user.email="email.123@domain.com"
    expect(user.valid?).to be_truthy
  end

  it "should validate email as false" do
    user.email="email@com."
    expect(user.valid?).to be_falsy
  end

  context "Associations" do
   it { should have_many(:uanswers) }
end
end

