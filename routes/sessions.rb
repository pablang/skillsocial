post '/sessions/new' do
    user = Users.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/'
    else
      erb :login
    end
  end

delete '/sessions' do
    session[:user_id] = nil
    redirect '/'
end