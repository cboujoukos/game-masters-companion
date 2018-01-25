require 'rack-flash'

class ApplicationController < Sinatra::Base
  use Rack::Flash, :sweep => true
  helpers Sinatra::ContentFor

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get '/' do
    if logged_in?
      @user = User.find(session[:id])
      @campaigns = @user.campaigns
      erb :index
    else
      erb :'/users/login'
    end
  end

  get '/encounter_generator' do
    erb :encounter_generator
  end

  helpers do
    def logged_in?
      !!session[:id]
    end

    def current_user
      User.find(session[:id])
    end
  end
end
