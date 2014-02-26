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

  def like_clicked
    @clip = Clip.find(params[:id])
    # unless Like.find_by(user_id: current_user.id, clip_id: @clip.id)
      @clip.likes << Like.new(user_id: current_user.id)
    # end
    respond_to do |f|
      # f.json { render :json => {count: @clip.likes.count}}
      f.json { render :json => {clip: @clip, count: @clip.likes.count}}
    end
  end

  def destroy
  end

end
