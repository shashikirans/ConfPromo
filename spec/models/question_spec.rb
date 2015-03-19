require 'rails_helper'

RSpec.describe Question, type: :model do
context "Associations" do
   it { should have_many(:uanswers) }
   it { should have_many(:qchoices) }
 end
end
