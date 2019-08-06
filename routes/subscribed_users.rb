post '/subscribed_users/new' do
  sub_user = EventSubscription.new
  sub_user.subscribed_user_id = params[:user_id]
  sub_user.subscribed_event_id = params[:event_id]
  sub_user.save
  redirect "/events/#{params[:event_id]}"
end
