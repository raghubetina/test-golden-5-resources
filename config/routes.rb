Rails.application.routes.draw do
  # Routes for the Movie resource:

  # CREATE
  match("/insert_movie", { :controller => "movies", :action => "create", :via => "post"})
          
  # READ
  match("/movies", { :controller => "movies", :action => "index", :via => "get"})
  
  match("/movies/:the_movie_id", { :controller => "movies", :action => "show", :via => "get"})
  
  # UPDATE
  
  match("/modify_movie/:the_movie_id", { :controller => "movies", :action => "update", :via => "post"})
  
  # DELETE
  match("/delete_movie/:the_movie_id", { :controller => "movies", :action => "destroy", :via => "get"})

  #------------------------------

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
