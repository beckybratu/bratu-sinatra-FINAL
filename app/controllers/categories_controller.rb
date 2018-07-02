class CategoriesController < ApplicationController

get "/categories" do
  if logged_in?
    @user = current_user
    @categories = Category.all
    erb :'/categories/categories'
  else
    redirect to '/login'
  end
end

post '/categories' do
  @user = current_user
  @category = Category.create(:name => params[:name])
  @title = Title.find_or_create_by(name: params[:name])
  @category.save
  redirect to "/categories/#{@category.name}"
end

get '/categories/new' do
  @user = current_user
  erb :'categories/new'
end


end
