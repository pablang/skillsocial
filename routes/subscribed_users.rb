post "/subscribed_users/new" do

user = User.new
user.user_id = params[:user_id]
user.event_id = params[:event_id]
user.save
redirect "/events/#{params[:event_id]}"
end