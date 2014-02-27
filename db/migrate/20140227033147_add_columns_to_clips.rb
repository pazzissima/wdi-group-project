class AddColumnsToClips < ActiveRecord::Migration
  def change
    add_column :clips, :snippable_id, :integer
    add_column :clips, :snippable_type, :string
    add_column :clips, :startTime, :integer
    add_column :clips, :endTime, :integer
  end
end
