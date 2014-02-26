class AddSnippableToClips < ActiveRecord::Migration
  def change
    add_column :clips, :snippable_id, :integer
    add_column :clips, :snippable_type, :string
  end
end
