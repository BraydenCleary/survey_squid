class ResponseValidator < ActiveModel::Validator
  def validate(record)
    unless record.survey.questions.length == record.user_responses.length
      record.errors[:survey_completion] << "Must answer every question"
    end
  end
end


class UserSurvey < ActiveRecord::Base
  include ActiveModel::Validations
  validates_presence_of :user_id, :survey_id
  validates_with ResponseValidator
  validates_uniqueness_of :user_id, :scope => :survey_id
  
  belongs_to :survey
  belongs_to :user
  has_many   :user_responses
  
  before_create :save_responses

  private
    def save_responses
      self.user_responses.each {|user_response| user_response.save }
    end
end
