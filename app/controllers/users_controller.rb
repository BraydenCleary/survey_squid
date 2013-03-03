before do
  @user ||= User.find(session[:user_id]) if session[:user_id]
end

post '/users/new' do 
  user = User.new(params)
  user.password_confirmation = params[:password_confirmation]
  if user.save
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    @creation_errors = user.errors.messages
  end
  erb :index
end

get '/users/:id' do
  redirect '/' unless session[:user_id]
  @user_surveys = @user.surveys_created
  @surveys = non_completed_surveys
  erb :user
end


def non_completed_surveys
  Survey.all - @user.surveys
end
