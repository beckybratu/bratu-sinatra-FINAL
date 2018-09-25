require './config/environment'
require 'sinatra/base'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
    register Sinatra::Flash
  end

  get '/' do
    erb :index
  end

  get "/signup" do
    if !logged_in?
      erb :'users/create_user'
    else
      redirect '/titles'
    end
  end

  post "/signup" do
    user = User.new(:name => params[:name], :email => params[:email], :password => params[:password])
    if user.save
      session[:user_id]= user.id
      redirect "/subscriptions/new"
    else
      flash[:message] = "Signing up failed. Please try again! #{user.errors.full_messages.to_sentence}."
      redirect to '/signup'
    end
  end

  get "/login" do
    if logged_in?
       @user = User.find_by(name: params[:name])
       redirect to "/users/#{current_user.id}"
    else
      erb :login
    end
  end

  post "/login" do
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
  	   session[:user_id] = @user.id
       redirect to "/users/#{current_user.id}"
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
      User.find(session[:user_id]) if session[:user_id]
      end
    end



end
