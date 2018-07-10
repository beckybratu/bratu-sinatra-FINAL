class SubscriptionsController < ApplicationController

  get "/subscriptions" do
    @user = current_user
    erb :'/subscriptions/subscriptions'
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      User.find(session[:user_id])
    end
  end

end
