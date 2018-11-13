class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end



  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    @recipe = Recipe.create(:recipe_name => params[:recipe_name], :recipe_ingredients => params[:recipe_ingredients], :recipe_cook_time => params[:recipe_cook_time])
    redirect to "/recipes/#{@recipe.id}"
  end
end
