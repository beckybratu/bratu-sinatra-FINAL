require 'sinatra/base'
require 'rack-flash'

class SubscriptionsController < ApplicationController

  enable :sessions
  use Rack::Flash

  # TITLES = ["Vogue", "W", "Glamour", "Vanity Fair", "The New Yorker", "Wired", "GQ", "Conde Nast Traveler",
  # "Architectural Digest", "Allure", "Brides", "Golf Digest", "Bon Appetit", "Self", "Teen Vogue", "Golf World",
  # "Epicurious", "Pitchfork", "Ars Technica", "The New York Times", "The Washington Post", "USA Today"].freeze

  get "/subscriptions/new" do
    if logged_in?
      @user = current_user
      @subscription_levels = Subscription.subscription_levels
      @titles = Title.all
      erb :'/subscriptions/new'
    else
      redirect to '/login'
    end
  end


  get '/show' do
    @user = current_user
    @titles = Title.all
    @subscription = current_user.subscription
    erb :'users/show'
  end

  post '/show' do
    @user = current_user
    @subscription = params[:level]
    if @subscription == "lite"
      @titles = Title.all.sample(5)
    elsif @subscription == "extra"
      @titles = Title.all.sample(12)
    else
      @titles = Title.all 
    end
    erb :'users/show'
  end




end
