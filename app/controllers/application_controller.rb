require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  get "/signup" do
    if !logged_in?
      erb :'users/create_user'
    else
      redirect '/subscriptions'
    end
  end

  post "/signup" do
    user = User.new(:name => params[:name], :email => params[:email], :password => params[:password])
    if user.save
      session[:user_id]= user.id
      redirect "/titles"
    else
      redirect to '/signup'
    end
  end

  get "/login" do
    if logged_in?
       redirect to '/subscriptions'
    else
      erb :login
    end
  end

  post "/login" do
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
  	   session[:user_id] = user.id
  	   redirect '/subscriptions'
    else
      redirect '/login'
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect '/login'
    else
      redirect '/'
    end
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(session[:user_id]) if session[:user_id]
    end
  end

end
