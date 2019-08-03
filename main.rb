     
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry'
require_relative 'database_config'
require_relative 'models/user'
require_relative 'models/event'
require_relative 'models/event_subscription'

enable :sessions

helpers do
  def logged_in?
    if current_user
      return true
    else 
      return false
    end
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def show_date(date)
    date.strftime("%d/%m/%y")
  end
  
  def show_time(time)
    time.strftime("%H:/%M")
  end
end

after do 
  ActiveRecord::Base.connection.close
end

get '/' do
  @events = Event.all.order(date_time: :asc)
  @users = User.all
  @user = current_user
  erb :index
end

get '/login' do
  erb :login
end

require_relative 'routes/sessions'
require_relative 'routes/users'
require_relative 'routes/events'
require_relative 'routes/feedback'
require_relative 'routes/subscribed_users'



