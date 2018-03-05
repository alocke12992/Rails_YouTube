class CommentsController < ApplicationController
  before_action :set_movie
  before_action :set_comment, only: [:show, :edit, :update, :destroy ]
  before_action :set_user 
  def new
    @comment = Comment.new
  end

  def show
    binding.pry 
  end

  def edit
  end

  def create
    @comment = @movie.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment_name = current_user.first_name
    @user 
    if @comment.save
      redirect_to movie_path(@movie)
    else
      render :new
    end
    binding.pry
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

    def set_user
      @user = current_user
    end 
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
