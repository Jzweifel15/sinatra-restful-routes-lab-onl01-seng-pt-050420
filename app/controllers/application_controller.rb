class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/' do 
    redirect 'recipes'
  end
  
  get '/recipes' do 
    @recipes = Recipe.all
    
    erb :index  
  end
  
  get '/recipes/new' do 
    erb :new
  end
  
  get '/recipes/:id' do
    #@article = Article.find_by(id: params[:id])
    
    erb :show
  end
  
  post '/recipes' do 
    @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    
    redirect "/recipes/#{@recipe.id}"
  end
  
end
