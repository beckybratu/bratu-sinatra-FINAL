class UsersController < ApplicationController

  get '/show' do
    @user = current_user
    @titles = params[:user][:title]
    @subscription_levels = Subscription.subscription_levels
  end



end
