get '/events' do
  @events = Event.all.order(date_time: :asc)
  erb :events
end

get '/events/:id' do
  @event = Event.find(params[:id])
  erb :event_details
end

get '/events/:id/edit' do
  @event = Event.find(params[:id])
  erb :edit_event
end

get '/events/new/form' do
  redirect '/login' unless session[:user_id]
  erb :new_event
end

post '/events/new' do
  redirect '/login' unless session[:user_id]
  @event = Event.new
  @event.name = params[:name]
  @event.date_time = "#{params[:date]} #{params[:time]}"
  @event.location = params[:location]
  @event.image_url = params[:image_url]
  @event.description = params[:description]
  @event.user_id = current_user.id
  if @event.valid?
    begin
      @event.save
      redirect "/events/#{@event.id}"
    rescue
      flash.now[:error] = 'User not saved. Please try again later'
      halt 400, erb(:new_event)
    end
  else
    flash.now[:error] = []
    @event.errors.messages.each do |error|
      flash.now[:error] << error.first.to_s + ' ' + error.second.join(' and ')
    end
    halt 400, erb(:new_event)
  end
end

put '/events/:id' do
  redirect '/login' unless current_user
  @event = Event.find(params[:id])
  @event.name = params[:name]
  @event.date_time = "#{params[:date]} #{params[:time]}"
  @event.image_url = params[:image_url]
  @event.location = params[:location]
  @event.description = params[:description]
  @event.user_id = current_user.id
  if @event.valid?
    begin
      @event.save
      redirect "/events/#{@event.id}"
    rescue
      flash.now[:error] = 'User not saved. Please try again later'
      halt 400, erb(:edit_event)
    end
  else
    flash.now[:error] = []
    @event.errors.messages.each do |error|
    flash.now[:error] << error.first.to_s + ' ' + error.second.join(' and ')
    end
    halt 400, erb(:edit_event)
  end
end
