     
require 'sinatra'
require 'sinatra/reloader'
require 'bcrypt'
require 'pry'
require_relative 'database_config'
require_relative 'models/user'



enable :sessions

after do 
  ActiveRecord::Base.connection.close
end

get '/' do
  erb :index
end

get '/login' do
  erb :login
end

post '/sessions/new' do
  user = User.find_by(email: params[:email])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect '/'
  else
    erb :login
  end
end




