class ClipsController < ApplicationController

  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :snippet]
  require 'open-uri'

  def index
    @clips = Clip.all
    # for c in @clips
    #   update_score c
    # end
    ScoreWorker.perform_async()
    @clip_display = Clip.limit(20).order('score DESC')
  end

  def new
    @clip = Clip.new()
  end

  def snippet
    startTime = (params[:snippet][:minutes].to_i * 60) + (params[:snippet][:seconds].to_i)
    endTime = params[:snippet][:endTime].to_i
    parent_clip = Clip.find(id = params[:id])
    @clip = Clip.create(title: params[:snippet][:title], description: params[:snippet][:description], performer: parent_clip.performer, mp3: parent_clip.mp3, startTime: startTime, endTime: endTime)
    parent_clip.clips << @clip
    @clip.tags = parent_clip.tags
    @clip.update_column(:user_id, current_user.id)
    redirect_to clip_path(@clip)
  end

  def create
    clip = current_user.clips.create(params.require(:clip).permit(:mp3, :title, :performer, :description))
    if clip.id != nil
      tag_string = params.require(:tags).permit(:text)[:text]
      tag_array = tag_string.split(", ")

      tag_array.each do |tag|
        clip.tags.create(text: tag)
      end
      GeoWorker.perform_async(clip.id, request.remote_ip)

      redirect_to clip_path(clip)
    else
      redirect_to clips_path
    end
  end

  def edit
  end

  def update
  end

  def show
    @clip = Clip.find(params[:id])
    @clip_comments = @clip.comments
    @tags = @clip.display_tags
    @parent = Clip.find(@clip.snippable_id) if @clip.snippable_id
    @comment = Comment.new
    @playlist = Playlist.new
  end

  # show all snippets attributed to a given clip
  def snippets
    @clip = Clip.find(params[:id])
  end

  def like_clicked
    @clip = Clip.find(params[:id])
    if user_signed_in?
      unless Like.find_by(user_id: current_user.id, clip_id: @clip.id)
        @clip.likes << Like.new(user_id: current_user.id)
      end
    end
    respond_to do |f|
      # f.json { render :json => {count: @clip.likes.count}}
      f.json { render :json => {clip: @clip, count: @clip.likes.count}}
    end
  end

  def update_score clip
    # created_time = clip.created_at
    # hours_since = (Time.now()-created_time)/3600
    # if hours_since < 100
    #   likes = clip.likes.count
    #   score = (likes**0.8)/((hours_since+2)**1.8)
    # else
    #   score = 0
    # end
    # clip.update_column(:score, score)
  end

  def add_to_playlist
    @clip = Clip.find(params[:clip_id])
    @playlist = Playlist.find(params[:id])

    unless @clip.playlists.exists?(id: @playlist.id)
      @clip.playlists << @playlist
    end

    # if current_user.playlists == []
    #   new_playlist = Playlist.create(title: "Favorites")
    #   current_user.playlists << new_playlist
    #   new_playlist.clips << @clip
    # end
    respond_to do |f|
      f.json { render :json => {clip: @clip, playlist: @playlist}}
    end
  end

  def map_clips
    @clips = Clip.where.not(latitude:  nil)
    respond_to do |f|
      f.html
      f.json { render :json => @clips, only: [:title, :latitude, :longitude]}
    end

  end


  def destroy
  end

end
