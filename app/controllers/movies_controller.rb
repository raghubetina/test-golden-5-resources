class MoviesController < ApplicationController
  def index
    @movies = Movie.all.order({ :created_at => :desc })

    render({ :template => "movies/index.html.erb" })
  end

  def show
    the_id = params.fetch("the_movie_id")
    @movie = Movie.where({:id => the_id }).first

    render({ :template => "movies/show.html.erb" })
  end

  def create
    @movie = Movie.new
    @movie.title = params.fetch("input_title")
    @movie.year = params.fetch("input_year")
    @movie.description = params.fetch("input_description")
    @movie.released = params.fetch("input_released", false)
    @movie.a_time = params.fetch("input_a_time")
    @movie.a_date = params.fetch("input_a_date")
    @movie.a_datetime = params.fetch("input_a_datetime")

    if @movie.valid?
      @movie.save
      redirect_to("/movies", { :notice => "Movie created successfully."})
    else
      redirect_to("/movies", { :notice => "Movie failed to create successfully."})
    end
  end

  def update
    the_id = params.fetch("the_movie_id")
    @movie = Movie.where(:id => the_id).at(0)

    @movie.title = params.fetch("input_title", @movie.title)
    @movie.year = params.fetch("input_year", @movie.year)
    @movie.description = params.fetch("input_description", @movie.description)
    @movie.released = params.fetch("input_released", false)
    @movie.a_time = params.fetch("input_a_time", @movie.a_time)
    @movie.a_date = params.fetch("input_a_date", @movie.a_date)
    @movie.a_datetime = params.fetch("input_a_datetime", @movie.a_datetime)

    if @movie.valid?
      @movie.save
      redirect_to("/movies/#{@movie.id}", {:notice => "Movie updated successfully."})
    else
      render({ :template => "movies/show.html.erb" })
    end
  end

  def destroy
    the_id = params.fetch("the_movie_id")
    @movie = Movie.where({ :id => the_id }).first

    @movie.destroy

    redirect_to("/movies", {:notice => "Movie deleted successfully."})
  end
end
