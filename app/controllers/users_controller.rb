class UsersController < ApplicationController

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
    erb :login
  end

  post '/' do
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:id] = @user.id
      redirect '/'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

end
