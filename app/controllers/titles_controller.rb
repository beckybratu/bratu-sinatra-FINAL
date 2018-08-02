class TitlesController < ApplicationController

# TITLES = ["Vogue", "W", "Glamour", "Vanity Fair", "The New Yorker", "Wired", "GQ", "Conde Nast Traveler",
# "Architectural Digest", "Allure", "Brides", "Golf Digest", "Bon Appetit", "Self", "Teen Vogue",
# "Epicurious", "Pitchfork", "Ars Technica", "The New York Times", "The Washington Post", "USA Today"].freeze

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
