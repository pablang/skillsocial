     
require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative 'database_config'
require_relative 'models/user'
require_relative 'models/event'



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
    Users.find_by(id: session[:user_id])
  end
end

after do 
  ActiveRecord::Base.connection.close
end

get '/' do
  @user = current_user
  erb :index
end

get '/login' do
  erb :login
end

require_relative 'routes/sessions'
require_relative 'routes/users'
require_relative 'routes/events'



