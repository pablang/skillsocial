
get '/signup' do
    erb :signup
  end
  
post '/users/new' do
    user = Users.new
    user.email = params[:email]
    user.name = params[:name]
    user.username = params[:username]
    user.password = params[:password]
    user.image_url = params[:image_url]
    user.phone = params[:phone]
    user.skills = params[:skills]
    user.interests = params[:interests]
    user.save
    session[:user_id] = user.id
    redirect '/users/profile'
end
  
get '/users/profile' do
    @user = current_user
    erb :profile
end