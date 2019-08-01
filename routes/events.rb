get '/events' do
    @events = Events.all
    erb :events
end
   
get '/events/new' do
    redirect '/login' unless session[:user_id]
    erb :new_event
end

post '/events/new' do
    redirect '/login' unless session[:user_id]
    event = Events.new
    event.name = params[:name]
    event.date_time = "#{params[:date]} #{params[:time]}"
    event.location = params[:location]
    event.description = params[:description]
    event.save
    redirect '/events'
end