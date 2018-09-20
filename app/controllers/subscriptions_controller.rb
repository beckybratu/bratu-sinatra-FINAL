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
    @subscription = Subscription.create(params[:subscription])
    if !params["title"]["name"].empty?
      @subscription.titles << Title.create(name: params["title"]["name"])
      @subscription.save
      redirect to "subscriptions/#{@subscription.id}"
    else
       redirect to "/subscriptions/new"
    end
  end


  get '/subscriptions/:id' do
    @user = current_user
    @subscription = Subscription.find(params[:id])
    erb :'subscriptions/show'
  end


  get '/subscriptions/:id/edit' do
    @subscription = Subscription.find(params[:id])
    erb :'/subscriptions/edit'
  end


  post '/subscriptions/:id' do
    @subscription = Subscription.find(params[:id])
    @subscription.update(params["subscription"])
    if !params["title"]["name"].empty?
      @subscription.titles << Title.create(name: params["title"]["name"])
    end
    redirect to "subscription/#{@subscription.id}"
  end



end
