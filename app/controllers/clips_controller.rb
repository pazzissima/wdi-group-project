class ClipsController < ApplicationController
  def index
    # @clips = [{:title => "Song 1", :description => "great song", :id => 1, :performer => "Madonna"}, {:title => "Song 2", :description => "awesome song", :id => 2, :performer => "Beyonce"}, {:title => "Song 3", :description => "great song", :id => 3, :performer => "Jay Z"}]
    @clips = Clip.all
  end

  def new
    @clip = Clip.new()
  end

  def create
    @clip = Clip.create(params.require(:clip).permit(:mp3, :title, :performer, :description))
    redirect_to clip_path(@clip)
  end

  def show
    @clip = Clip.find(params[:id])

    @clip_comments = @clip.comments
  end

  def destroy
  end

end
