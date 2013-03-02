class UserResponse < ActiveRecord::Base
  belongs_to :user_survey
  belongs_to :response
end
