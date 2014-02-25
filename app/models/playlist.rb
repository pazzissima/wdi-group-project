class Playlist < ActiveRecord::Base
  belongs_to :user
  has_many :clip_playlists
  has_many :clips, through: :clip_playlists
  accepts_nested_attributes_for :clips
end
