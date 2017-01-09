class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
    @movie = Movie.find(params[:movie_id])  
    if current_user.comments.where(movie_id: params[:movie_id]).count > 0
      session[:return_to] ||= request.referer
    else

    @comment = @movie.comments.create(comment_params)
    @movie.comments.create(comment_params)
    redirect_to movie_path(@movie)
  end
  end

   def destroy
    @movie = Movie.find(params[:movie_id])
    @comment = @movie.comments.find(params[:id])
    @comment.destroy
    redirect_to movie_path(@movie)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:body, :vote).merge(:user_id => current_user.id)
    end
end
