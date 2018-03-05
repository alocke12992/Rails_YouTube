class CommentsController < ApplicationController
  before_action :set_movie
  before_action :set_comment, only: [:show, :edit, :update, :destroy ]

  def new
    @comment = Comment.new
  end

  def show
  end

  def edit
  end

  def create
    @comment = @movie.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to movie_path(@movie)
    else
      render :new
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to movie_path(@movie)
    else
      render :edit
    end

    def destroy
      @comment.destroy
      redirect_to movie_comments_path
    end
  end

  private

    def set_movie
      @movie = Movie.find(params[:movie_id])
    end

    def set_comment
        @comment = Comment.find(params[:id])
      end


    def comment_params
      params.require(:comment).permit(:body)
    end

end
