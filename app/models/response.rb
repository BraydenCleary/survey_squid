class Response < ActiveRecord::Base
  belongs_to :question
  has_many :users, :through => :user_responses
  has_many :user_responses
end
