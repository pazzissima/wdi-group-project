class AddAttachmentToClip < ActiveRecord::Migration
  def change
  	add_attachment :clips, :mp3
  end
end
