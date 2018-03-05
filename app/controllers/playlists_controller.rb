class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :update, :edit, :destroy]
  before_action :set_p_movie_id, only: [:add_movie_to_playlist] 
  before_action :set_account 
  def index
    @playlists = Playlist.all
  end

  def add_movie 
    @movies = Movie.all 
    @playlist = Playlist.find(params[:id])
  end 

  def add_movie_to_playlist
    @movies = Movie.all
    @playlist.playlist_movies = "#{@playlist.playlist_movies}, #{@movie.id}"
    @array =  @playlist.playlist_movies
    @a = @array.split(",")
     @playlist.playlist_movies = @a.join(",")
    @playlist.save
    render :show
  end

  def show
    @movies = Movie.all
    @array = @playlist.playlist_movies
    @playlist.save
  end

  def new
    @playlist = Playlist.new
  end

  def edit
  end

  def create
    @playlist = @account.playlist.new(playlist_params)
   
    if @playlist.save
      redirect_to account_playlists_path(@account)
    else
      render :new
    end
  end

  def update
    if @playlist.update(playlist_params)
      redirect_to @playlist
    else
      render :edit
    end
  end

  def destroy
    @playlist.destroy
    redirect_to playlists_index_path
  end

  private
    def set_p_movie_id
      @playlist = Playlist.find(params[:p])
      @movie = Movie.find(params[:m])
    end
     def set_movie
      @movie = Movie.find(params[:movie_id])
    end

    def set_playlist
      @playlist = Playlist.find(params[:id])
    end

    def playlist_params
      params.require(:playlist).permit(:title)
    end

    def set_account 
      @account = current_user.accounts
    end 
end 
