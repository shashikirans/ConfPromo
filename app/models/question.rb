class Question < ActiveRecord::Base
  has_many :qchoices
  has_many :uanswers
  belongs_to :user
end
