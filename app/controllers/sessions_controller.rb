post '/sessions/new' do
  user = User.find_by_email(params[:email])
  if user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    @login_error = "Could not authenticate.  Please re-enter credentials"
    erb :index
  end

end

get '/logout' do
  session.clear
  redirect '/'
end
