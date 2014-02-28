class PlaylistsController < ApplicationController
  def index
    @playlists = current_user.playlists
    @playlist = Playlist.new
  end

  def new
    @playlist = Playlist.new
  end

  def create
    playlist = current_user.playlists
      .create(params.require(:playlist).permit(:title))

    redirect_to playlists_path
  end

  def edit
  end


  def show
    @playlist = Playlist.find(params[:id])
  end

  def destroy
  end

end
