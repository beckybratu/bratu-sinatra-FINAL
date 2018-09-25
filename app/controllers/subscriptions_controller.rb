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
    # @subscription = Subscription.create(params[:subscription])
    # if !params[:subscription].empty?
    #   @subscription = params[:title_id]
    #   redirect to "subscriptions/#{@subscription.id}"
    # else
    #    redirect to "/subscriptions/new"
    # end

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
    @subscription = Subscription.find(params[:id])
    if @subscription.user_id = current_user.id
      erb :'/subscriptions/edit'
    else
      redirect to '/index'
    end     #do the same for delete
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
