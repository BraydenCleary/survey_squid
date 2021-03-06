class User < ActiveRecord::Base
  has_secure_password
  has_many :surveys,   :through => :user_surveys
  has_many :user_surveys
  has_many :responses, :through => :user_responses
  has_many :user_responses

  validates :name, :email, :password_digest, :presence => true
  validates :email, :format => { :with => /.*@.*\..*/}

  def surveys_created
    Survey.where(:creator_id => self.id)
  end

end
