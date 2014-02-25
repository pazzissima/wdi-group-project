class CreateClipPlaylists < ActiveRecord::Migration
  def change
    create_table :clip_playlists do |t|
      t.belongs_to :clip, index: true
      t.belongs_to :playlist, index: true

      t.timestamps
    end
  end
end
