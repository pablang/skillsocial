get '/signup' do
  erb :signup
end

post '/signup' do
  @user = User.new
  @user.email = params[:email]
  @user.name = params[:name]
  @user.username = params[:username]
  @user.password = params[:password]
  @user.image_url = params[:image_url]
  @user.phone = params[:phone]
  @user.about_me = params[:about_me]
  @user.skills = params[:skills]
  @user.interests = params[:interests]
  if @user.valid?
    begin
      @user.save
      session[:user_id] = @user.id
      redirect "/users/#{current_user.id}"
    rescue
      flash.now[:error] = 'User not saved. Please try again later'
      halt 400, erb(:signup)
    end
  else
    flash.now[:error] = []
    @user.errors.messages.each do |error|
      flash.now[:error] << error.first.to_s + ' ' + error.second.join(' and ')
    end
    halt 400, erb(:signup)
  end
end

get '/users/:id' do
  # profile of person
  @user = User.find(params[:id])
  # events created by person
  @events = Event.where(user_id: @user.id)

  # only show comments from UserComment where teacher.id is @user
  @comments = UserComment.where(teacher_id: @user.id)
  # .order(created_at: :desc)

  # a person has attended an event when the event includes the current user
  has_attended?(@user)

  @event_name = params[:event]
  # binding.pry
  erb :profile
end

get '/users/:id/edit' do
  @user = User.find(session[:user_id])
  erb :edit_profile
end

put '/users/:id' do
  redirect '/login' unless session[:user_id]
  @user = User.find(session[:user_id])
  @user.email = params[:email]
  @user.name = params[:name]
  @user.username = params[:username]
  @user.image_url = params[:image_url]
  @user.phone = params[:phone]
  @user.skills = params[:skills]
  @user.interests = params[:interests]
  if @user.valid?
    begin
      @user.save
      session[:user_id] = @user.id
      redirect "/users/#{current_user.id}"
    rescue
      flash.now[:error] = 'User not saved. Please try again later'
      halt 400, erb(:edit_profile)
    end
  else
    flash.now[:error] = []
    @user.errors.messages.each do |error|
      flash.now[:error] << error.first.to_s + ' ' + error.second.join(' and ')
    end
    halt 400, erb(:edit_profile)
  end
end
