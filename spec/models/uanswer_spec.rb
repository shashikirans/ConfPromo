require 'rails_helper'

RSpec.describe Uanswer, type: :model do
  context "Associations" do
   it { should belong_to(:user) }
   it { should belong_to(:question) }
 end
end
