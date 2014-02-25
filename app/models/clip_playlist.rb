class ClipPlaylist < ActiveRecord::Base
  belongs_to :clip
  belongs_to :playlist
end
