class Survey < ActiveRecord::Base
  has_many :users, :through => :user_surveys
  has_many :user_surveys
  has_many :questions


  validates :title, :uniqueness => true 
  def creator
    User.find(self.creator_id)
  end


end
