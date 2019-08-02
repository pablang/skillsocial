get '/events' do
    @events = Events.all
    erb :events
end

get "/events/:id" do
    # @users = #users.where(event_id: params[:id])
    # binding.pry
    @event = Events.find(params[:id])
    erb :event_details
end
   
get '/events/new/form' do
    # binding.pry
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

    organisers_event = UsersEvents.new
    organisers_event = current_user.id
    organisers_event.save
    # binding.pry
    redirect '/events'
end