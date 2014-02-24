class ClipsController < ApplicationController
  def index
    # all public clips
    # OR random selection/popular clips
  end

  def new
  end

  def create
  end

  def show
    @clip = Clip.find(params[:id])
  end

  def destroy
  end

end
