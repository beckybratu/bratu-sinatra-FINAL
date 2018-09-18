class TitlesController < ApplicationController


get '/titles' do
  if logged_in?
    @user = current_user
    @titles = Title.all
    erb :'titles/titles'
  else
    redirect to '/login'
  end
end




end
