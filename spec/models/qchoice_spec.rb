require 'rails_helper'

RSpec.describe Qchoice, type: :model do
  context "Associations" do
   it { should belong_to(:question) }
 end
end
