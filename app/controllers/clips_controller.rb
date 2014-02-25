class ClipsController < ApplicationController
  def index
    # @clips = [{:title => "Song 1", :description => "great song", :id => 1, :performer => "Madonna"}, {:title => "Song 2", :description => "awesome song", :id => 2, :performer => "Beyonce"}, {:title => "Song 3", :description => "great song", :id => 3, :performer => "Jay Z"}]
    @clips = Clip.all
  end

  def new
    @clip = Clip.new()
  end

  def create
    clip = Clip.create(params.require(:clip).permit(:mp3, :title, :performer, :description))
    tag_string = params.require(:tags).permit(:text)[:text]
    tag_array = tag_string.split(", ")

    tag_array.each do |tag|
      clip.tags.create(text: tag)
    end
    redirect_to clip_path(clip)
  end

  def show
    @clip = Clip.find(params[:id])

    @clip_comments = @clip.comments

    @tags = @clip.display_tags
  end

  def destroy
  end

end
