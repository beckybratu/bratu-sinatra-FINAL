require 'sinatra/base'

class SubscriptionsController < ApplicationController

  enable :sessions

  get "/subscriptions/new" do
    if logged_in?
      @user = current_user
      @titles = Title.all
      erb :'/subscriptions/new'
    else
      redirect to '/login'
    end
  end

  post '/subscriptions' do
    if params[:subscription] != ""
       @subscription = Subscription.create(params[:subscription])
       @subscription.save
       redirect to "/subscriptions/#{@subscription.id}"
    else
       redirect to "/subscriptions/new"
    end
  end




  get '/subscriptions/:id' do
    @user = current_user
    @subscription = Subscription.find_by_id(params[:id])
    erb :'subscriptions/show'
  end


  # get '/show' do
  #   @user = current_user
  #   @titles = Title.all
  #   @subscription = current_user.subscription
  #   erb :'users/show'
  # end
  #
  # post '/show' do
  #   @user = current_user
  #   @subscription = params[:level]
  #   if @subscription == "lite"
  #     @titles = Title.all.sample(5)
  #   elsif @subscription == "extra"
  #     @titles = Title.all.sample(12)
  #   else
  #     @titles = Title.all
  #   end
  #   erb :'users/show'
  # end



end
