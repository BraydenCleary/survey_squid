class UserResponse < ActiveRecord::Base
  validates_presence_of :response_id, :question_id
  belongs_to :user_survey
  belongs_to :response
end
