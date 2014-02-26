class AddScoreToClip < ActiveRecord::Migration
  def change
  	add_column :clips, :score, :float, default: 0.0
  end
end
