class PlaylistsController < ApplicationController
  def index
    @playlists = current_user.playlists
  end

  def new
    @playlist = Playlist.new
  end

  def create
    playlist = current_user.playlists
      .create(params.require(:playlist).permit(:title))

    redirect_to playlist_path(playlist)
  end

  def edit
  end

  def update
    playlist = Playlist.find(params[:id])
    binding.pry

    redirect_to playlist_path(playlist)
  end

  def show
  end

  def destroy
  end

end
