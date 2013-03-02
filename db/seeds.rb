require 'faker'

users = []
20.times do 
  users << User.create(:name     => Faker::Name.name, 
              :email    => Faker::Internet.email,
              :password => 'password' )
end

surveys = []
20.times do 
  surveys << Survey.create(:title => Faker::Company.name,
                           :creator_id => users.sample.id)
end

questions = []
20.times do |counter|
  questions << Question.create(:content => Faker::Lorem.sentence(6),
                               :survey_id => surveys[counter].id)
end

responses = []
20.times do |counter|
  responses << Response.create(:text => Faker::Lorem.sentence(3),
                               :question_id => questions[counter].id)

end


user_surveys = []
20.times do |counter|
  user_surveys << UserSurvey.create(:user_id => users[counter].id,
                    :survey_id => surveys.reverse[counter].id)
end

20.times do |counter|
  response = responses[counter]
  UserResponse.create(:user_survey_id => user_surveys.reverse[counter].id,
                      :response_id => response.id,
                      :question_id => questions[counter].id)
  response.count += 1
  response.save
end
