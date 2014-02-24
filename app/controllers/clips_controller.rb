class ClipsController < ApplicationController
  def index
    # all public clips
    # OR random selection/popular clips
  end

  def new
    @clip = Clip.new()
  end

  def create
    @clip = Clip.create(params.require(:clip).permit(:mp3))
    render :show
  end

  def show
    @clip = Clip.find(params[:id])
  end

  def destroy
  end


end
