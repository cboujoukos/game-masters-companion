require 'rack-flash'

class UsersController < ApplicationController
  use Rack::Flash, :sweep => true

  get '/signup' do
    erb :'/users/create_user'
  end

  post '/signup' do
    user = User.new(params)
    if user.username != "" && user.email != "" && user.password != "" && user.save
      session[:id] = user.id
      redirect '/'
    else
      redirect '/signup'
    end
  end

  get '/login' do
    erb :'/users/login'
  end

  post '/' do
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:id] = @user.id
    else
      flash[:login_error] = "Incorrect email/password."
    end
    redirect '/'
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

end
