before do
  @user ||= User.find(session[:user_id]) if session[:user_id]
end

get '/surveys/new' do
  redirect '/' unless session[:user_id]
  erb :new_survey
end

post '/surveys' do
  survey = Survey.create(title: params.delete("title"), creator_id: @user.id)
  params.each do |throwaway, qr|
    quest = Question.create(content: qr.delete("question"), survey_id: survey.id)
    qr.each do |throw2, response|
      resp = Response.create(text: response, question_id: quest.id)
      # quest.responses << resp if resp.valid?
    end
    # survey.questions << quest
  end
  redirect to "/users/#{session[:user_id]}"

  #have questions check responses valid and surveys check that questions are valid
end

get '/surveys/:id/responses' do
  redirect '/' unless session[:user_id]
  @survey = Survey.find params[:id]
  erb :take_survey
end

post '/surveys/responses' do
  survey = Survey.find params.delete("survey_id")
  user_survey = UserSurvey.new(survey_id: survey.id, user_id: @user.id)
  params.each do |question_id, response_id|
    response = Response.find(response_id)
    response.update_attributes(:count => response.count + 1)
    user_response = UserResponse.new(question_id: question_id, response_id: response_id)
    user_survey.user_responses << user_response if user_response.valid?
  end
  if user_survey.save
    "Survey complete!"
  else
    "There was an error in completing your survey."
  end
end

get '/surveys/:id' do
  redirect '/' unless session[:user_id]
  @questions = Question.where(:survey_id => params[:id])
  
  erb :survey_results
end
