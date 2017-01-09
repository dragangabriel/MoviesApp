class ActorsController < ApplicationController
 before_action :authenticate_user!, :except => [:index, :show]
def new 
   @actor = Actor.new
end

def index
    @actors = Actor.all
  end

  def show
    @actor = Actor.find(params[:id])
    @movies = @actor.movies
  end

  def create
   @actor = Actor.new(actor_params)
	@movies = Movie.where(:id => params[:organizing_actor])
	@actor.movies << @movies 
    if @actor.save    	
    	redirect_to @actor
    else
      render 'new'
    end
  end


def edit
  @actor = Actor.find(params[:id])
end

def update
  @actor = Actor.find(params[:id])
 	@movies = Movie.where(:id => params[:organizing_actor])
	@actor.movies.destroy_all   
	@actor.movies << @movies 

  if @actor.update(actor_params)
    redirect_to @actor
  else
    render 'edit'
  end
end

def destroy
  @actor = Actor.find(params[:id])
  @actor.destroy
 
  redirect_to actors_path
end
 
private

  def actor_params
    params.require(:actor).permit(:name, :description, :dateOfBirth, :photo)
  end
end
