post '/feedback/new' do
  comment = Comment.new
  comment.body = params[:feedback]
  comment.user_id = params[:id]
  comment.received_user_id = params[:receiver]
  comment.save
  redirect "/users/#{params[:receiver]}"
end
