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

# get '/titles/new' do
#   if logged_in?
#     @user = current_user
#     @categories = Category.all
#     erb :'/titles/new'
#   else
#     redirect to '/login'
#   end
# end
#
#   post '/titles' do
#     if params[:name] != ""
#       @title = Title.create(:name => params[:name])
#       @title.save
#       redirect to "/titles/#{@title.id}"
#     else
#       redirect to "/titles/new"
#     end
#   end
#
#   get '/titles/:id' do
#     @user = current_user
#     @title = Title.find_by_id(params[:id])
#     erb :'titles/show'
#   end



end
