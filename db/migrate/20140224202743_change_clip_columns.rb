class ChangeClipColumns < ActiveRecord::Migration
  def change
    rename_column :clips, :private, :is_private
  end
end
