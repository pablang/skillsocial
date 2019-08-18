post '/subscribed_users/new' do
# if user is already attending event then alert user

  sub_user = EventSubscription.new
  sub_user.subscribed_user_id = params[:user_id]
  sub_user.subscribed_event_id = params[:event_id]
  sub_user.save
  redirect "/events/#{params[:event_id]}"
end

delete '/subscribed_users/:id' do
  # event = Event.find(params[:id])
  unrsvp = EventSubscription.where(subscribed_event: params[:id])
  unrsvp.where(subscribed_user: current_user).first.delete
  # binding.pry
  redirect "/events/#{params[:id]}"
end