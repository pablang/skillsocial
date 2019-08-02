post "/attendees/new" do

attendee = Attendees.new
attendee.user_id = params[:user_id]
attendee.event_id = params[:event_id]
attendee.save
redirect "/events/#{params[:event_id]}"
end