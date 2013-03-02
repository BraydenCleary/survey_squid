before do
  @user ||= User.find(session[:user_id]) if session[:user_id]
end

get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/sign_in' do
  user = User.find_by_email(params[:email])
  if user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect "/user"
  else
    @login_error = "Could not authenticate.  Please re-enter credentials"
    erb :index
  end

end

post '/create_user' do 
  user = User.new(params)
  user.password_confirmation = params[:password_confirmation]
  if user.save
    session[:user_id] = user.id
    redirect "/user"
  else
    @creation_errors = user.errors.messages
  end
  erb :index
end

get '/user' do
  redirect '/' unless session[:user_id]
  @user_surveys = @user.surveys_created
  @surveys = non_completed_surveys
  erb :user
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
  erb :surveys

  #have questions check responses valid and surveys check that questions are valid
end

get '/surveys/:id/response' do
  redirect '/' unless session[:user_id]
  @survey = Survey.find params[:id]
  erb :take_survey
end

post '/surveys/responses' do
  puts params
  survey = Survey.find params.delete("survey_id")
  user_survey = UserSurvey.new(survey_id: survey.id, user_id: @user.id)
  params.each do |question_id, response_id|
    user_response = UserResponse.new(question_id: question_id, response_id: response_id)
    user_survey.user_responses << user_response if user_response.valid?
  end
  if user_survey.save
    "Yay"
  else
    "Boo"
  end
end

get '/surveys/:id' do
  redirect '/' unless session[:user_id]
  erb :survey_results
end

get '/logout' do
  session.clear
  redirect '/'
end

def non_completed_surveys
  Survey.all - @user.surveys
end




















