class Question < ActiveRecord::Base
  has_many :qchoices
  belongs_to :user
end
