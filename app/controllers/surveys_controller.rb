before do
  @user ||= User.find(session[:user_id]) if session[:user_id]
end

get '/surveys/new' do
  redirect '/' unless session[:user_id]
  erb :new_survey
end

post '/surveys' do
  survey = Survey.create(title: params.delete("title"), creator_id: @user.id)
  puts survey.id
  qkeys = params.select {|s| s =~ /\Aq\d+\z/}.keys
  qkeys.each do |qkey|
    question = Question.create(content: params.delete(qkey), survey_id: survey.id)
    rkeys = params.select {|r| r.include?(qkey)}.keys
    rkeys.each do |rkey|
      Response.create(question_id: question.id, text: params.delete(rkey))
    end
  end
  redirect "/users/#{session[:user_id]}"
end

get '/surveys/:id/responses' do
  redirect '/' unless session[:user_id]
  @survey = Survey.find params[:id]
  erb :take_survey
end

post '/surveys/responses' do
  @survey = Survey.find params.delete("survey_id")
  user_survey = UserSurvey.new(survey_id: @survey.id, user_id: @user.id)
  params.each do |question_id, response_id|
    response = Response.find(response_id)
    response.update_attributes(:count => response.count + 1)
    user_response = UserResponse.new(question_id: question_id, response_id: response_id)
    user_survey.user_responses << user_response if user_response.valid?
  end
  if user_survey.save
    redirect to "/users/#{session[:user_id]}"
  else
    erb :take_survey
  end
end

get '/surveys/:id' do
  questions = Question.where(:survey_id => params[:id])
  responses = questions.map { |question| question.responses}
  @questions = {}
  questions.each do |question|
    @questions[question.content] = ""
    question.responses.each do |response|
      @questions[question.content] << "#{[response.text, response.count]},"
    end
  end
  erb :survey_results_graph
end


get '/surveys/:survey_id/questions/:question_id/results' do
  @question = Question.find(params[:question_id])
  responses = @question.responses
  @data = []
  responses.each do |response|
    @data << [response.text, response.count]
  end

end
