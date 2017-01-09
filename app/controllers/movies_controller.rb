
class MoviesController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
def new 
   @movie = Movie.new
end

def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    @actors = @movie.actors
    @recommendations = Movie.top(3)
  end

  def create
   @movie = Movie.new(movie_params)
 
    if @movie.save
    redirect_to @movie
    else
      render 'new'
    end
  end


def edit
  @movie = Movie.find(params[:id])
end

def update
  @movie = Movie.find(params[:id])
 
  if @movie.update(movie_params)
    redirect_to @movie
  else
    render 'edit'
  end
end

def destroy
  @movie = Movie.find(params[:id])
  @movie.destroy
 
  redirect_to movies_path
end
 
private

  def movie_params
    params.require(:movie).permit(:name, :releaseYear, :duration, :genres, :description, :trailerUrl, :image1, :image2, :image3)
  end
end
