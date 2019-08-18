post '/feedback/new' do
  comment = Comment.new
  comment.body = params[:feedback]
  comment.user_id = params[:id]
  comment.received_user_id = params[:receiver]
  # comment.event_name = params[:event_name]
  if comment.save
    comments = UserComment.new
    comments.teacher_id = params[:receiver]
    comments.student_comment_id = comment.id
    comments.save
    redirect "/users/#{params[:receiver]}"
  else
    "something went wrong"
  end
end
