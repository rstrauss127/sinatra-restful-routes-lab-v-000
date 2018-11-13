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

  get '/recipes/:id'do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end
end
