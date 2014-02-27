class ClipsController < ApplicationController

  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  require 'open-uri'

  def index
    @clips = Clip.all
    for c in @clips
      update_score c
    end
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
    redirect_to clip_path(@clip)
  end

  def create
    clip = current_user.clips.create(params.require(:clip).permit(:mp3, :title, :performer, :description))
    tag_string = params.require(:tags).permit(:text)[:text]
    tag_array = tag_string.split(", ")

    tag_array.each do |tag|
      clip.tags.create(text: tag)
    end
    ip_address = open('http://whatismyip.akamai.com').read
    cords = Geocoder.coordinates(ip_address)
    clip.update_attributes({ip_address: ip_address, latitude: cords[0], longitude: cords[1]})

    redirect_to clip_path(clip)
  end

  def edit
  end

  def update
  end

  def show
    @clip = Clip.find(params[:id])
    @clip_comments = @clip.comments

    @tags = @clip.display_tags
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
    created_time = clip.created_at
    hours_since = (Time.now()-created_time)/3600
    if hours_since < 100 
      likes = clip.likes.count
      score = (likes**0.8)/((hours_since+2)**1.8)
    else 
      score = 0
    end
    clip.update_column(:score, score)
  end



  def destroy
  end

end
