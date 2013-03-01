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
    redirect "/user/#{user.id}"
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
    redirect "/user/#{user.id}"
  else
    @creation_errors = user.errors.messages
  end
  erb :index
end

get '/user' do
  redirect '/' unless session[:user_id]
  @user_surveys = @user.surveys
  @surveys = Survey.all
  erb :user
end

get '/surveys/new' do
  redirect '/' unless session[:user_id]
  
  erb :new_survey
end

post '/surveys/new' do
  #put surveys in database
end

get '/surveys/:id/response' do
  redirect '/' unless session[:user_id]
  erb :take_survey
end

post '/surveys/responses' do

end

get '/surveys/:id' do
  redirect '/' unless session[:user_id]
  erb :survey_results
end

get '/logout' do
  session.clear
  redirect '/'
end
