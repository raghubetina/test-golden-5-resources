class MoviesController < ApplicationController
  def index
    @movies = Movie.all.order({ :created_at => :desc })

    render({ :template => "movies/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @movie = Movie.where({:id => the_id }).at(0)

    render({ :template => "movies/show.html.erb" })
  end

  def create
    @movie = Movie.new
    @movie.title = params.fetch("title_from_query")
    @movie.year = params.fetch("year_from_query")
    @movie.description = params.fetch("description_from_query")
    @movie.released = params.fetch("released_from_query", false)
    @movie.a_time = params.fetch("a_time_from_query")
    @movie.a_date = params.fetch("a_date_from_query")
    @movie.a_datetime = params.fetch("a_datetime_from_query")

    if @movie.valid?
      @movie.save
      redirect_to("/movies", { :notice => "Movie created successfully."})
    else
      redirect_to("/movies", { :notice => "Movie failed to create successfully."})
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @movie = Movie.where(:id => the_id).at(0)

    @movie.title = params.fetch("title_from_query")
    @movie.year = params.fetch("year_from_query")
    @movie.description = params.fetch("description_from_query")
    @movie.released = params.fetch("released_from_query", false)
    @movie.a_time = params.fetch("a_time_from_query")
    @movie.a_date = params.fetch("a_date_from_query")
    @movie.a_datetime = params.fetch("a_datetime_from_query")

    if @movie.valid?
      @movie.save
      redirect_to("/movies/#{@movie.id}", {:notice => "Movie updated successfully."})
    else
      render({ :template => "movies/show.html.erb" })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @movie = Movie.where({ :id => the_id }).at(0)

    @movie.destroy

    redirect_to("/movies", {:notice => "Movie deleted successfully."})
  end
end
