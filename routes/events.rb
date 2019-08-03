get '/events' do
    @events = Event.all
    erb :events
end

get "/events/:id" do
    @event = Event.find(params[:id])
    erb :event_details
end
   
get '/events/new/form' do
    redirect '/login' unless session[:user_id]
    erb :new_event
end

post '/events/new' do
    redirect '/login' unless session[:user_id]
    event = Event.new
    event.name = params[:name]
    event.date_time = "#{params[:date]} #{params[:time]}"
    event.location = params[:location]
    event.description = params[:description]
    event.creator_id = current_user.id
    event.save
    redirect '/events'
end