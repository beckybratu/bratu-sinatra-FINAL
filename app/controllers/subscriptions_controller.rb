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
      @subscription = Subscription.new(:name => params[:name])
      @subscription_levels = Subscription.subscription_levels
      @titles = Title.all
      erb :'/subscriptions/new'
    else
      redirect to '/login'
    end
  end

  get "/subscriptions/lite" do
    @user = current_user
    @titles = Title.all
    erb :'/subscriptions/lite'
  end

  get "/subscriptions/extra" do
    @user = current_user
    @titles = Title.all
    erb :'/subscriptions/extra'
  end

  get "/subscriptions/everything" do
    @user = current_user
    @titles = Title.all
    erb :'/subscriptions/everything'
  end

  post '/show' do
    @user = current_user
    @titles = Title.all
    @subscription = current_user.subscription_ids
    # if params[:user][:subscription][:titles].length == 5
    #   erb :'users/show'
    # elsif (params[:user][:title].length) == "" || (params[:user][:title].length) < 5 || (params[:user][:title].length).between?(6,11)
    #   flash[:error] = "Please select five, 12, or more than 12 titles."
    #   erb :'subscriptions/new'
    # elsif params[:user][:title].length == 12
    #   erb :'users/show'
    # else
      erb :'users/show'
    # end
  end



end
