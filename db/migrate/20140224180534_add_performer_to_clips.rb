class AddPerformerToClips < ActiveRecord::Migration
  def change
    add_column :clips, :performer, :string
  end
end
