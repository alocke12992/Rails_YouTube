class PlaylistsController < ApplicationController
    def index
    @playlists= Playlist.where(account.id) 
  end

  def add_movies
    @movies = Movie.all
  end

  def show
    @playlist = Playlist.find(params[:id])
    @movies = Movie.where(playlist_id: @playlist.id)
  end

  def new
    @playlist = Playlist.new 
  end
  def create
    @playlist = Playlist.new(user_id: current_user.id, name: params["playlist"]["name"])

    if @playlist.save
      redirect_to playlists_path
    else
      render :new
    end

  end

  def destroy
    @playlist = Playlist.find(params[:id])
    @playlist.destroy 
    redirect_to playlists_path
  end
  private  
  
  def playlist_params
    params.require(:playlist).permit(:name, :user_id)
  end
end
