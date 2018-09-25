require 'sinatra/base'

class SubscriptionsController < ApplicationController

  enable :sessions

  get "/subscriptions/new" do
    if logged_in?
      @user = current_user
      @titles = Title.all
      current_user.titles = []
      erb :'/subscriptions/new'
    else
      redirect to '/login'
    end
  end

  post '/subscriptions' do
    params[:subscription][:title_ids].each do |title_id|
        if !current_user.title_ids.include?(title_id.to_i)
          current_user.titles << Title.find(title_id)
        end
      end
    redirect to "/users/#{current_user.id}"
  end


  get '/subscriptions/:id' do
    @user = current_user
    @subscription = Subscription.find(params[:id])
    erb :'subscriptions/show'
  end


  get '/subscriptions/:id/edit' do
    @user = current_user
    @subscription = Subscription.find(params[:id])
    if @subscription.user_id = current_user.id
      erb :'/subscriptions/edit'
    else
      redirect to '/'
    end
  end


  post '/subscriptions/:id' do
    @subscription = Subscription.find(params[:id])
    params[:subscription][:title_ids].each do |title_id|
        if !current_user.title_ids.include?(title_id.to_i)
          current_user.titles << Title.find(title_id)
        end
      end
    redirect to "/users/#{current_user.id}"
  end

  delete '/subscriptions/:id/delete' do
    @subscription = Subscription.find(params[:id])
    if @subscription.user_id = current_user.id
      current_user.titles.delete
      current_user.save
      redirect to "/subscriptions/#{@subscription.id}"
    else
      redirect to '/'
    end
  end

end
