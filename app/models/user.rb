class User < ActiveRecord::Base
  has_secure_password
  has_many :surveys,   :through => :user_surveys
  has_many :responses, :through => :user_responses
end
