
get '/signup' do
    erb :signup
  end
  
post '/users/new' do
    user = User.new
    user.email = params[:email]
    user.name = params[:name]
    user.username = params[:username]
    user.password = params[:password]
    user.image_url = params[:image_url]
    user.phone = params[:phone]
    user.about_me = params[:about_me]
    user.skills = params[:skills]
    user.interests = params[:interests]
    user.save
    session[:user_id] = user.id
    redirect "/users/#{current_user}"
    # to do capture error and alert look at begin rescue
    # if user.save
    #   session[:user_id] = user.id
    #   redirect "/users/#{current_user}"
    # else
    #   redirect "/signup"
    # end
end

get '/users/:id' do
  @user = User.find(params[:id])
  @events = Event.where(user_id: @user.id)
  erb :profile
end
  
get '/users/:id/edit' do
  @user = User.find(session[:user_id])
  erb :edit_profile
end

put "/users/:id" do
  redirect '/login' unless session[:user_id]
  user = User.find(session[:user_id])
  user.email = params[:email]
  user.name = params[:name]
  user.username = params[:username]
  user.image_url = params[:image_url]
  user.phone = params[:phone]
  user.skills = params[:skills]
  user.interests = params[:interests]
  user.save
  redirect "/users/#{current_user.id}"
end