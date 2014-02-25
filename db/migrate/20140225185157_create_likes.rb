class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :user, index: true
      t.references :clip, index: true
      t.string :location

      t.timestamps
    end
  end
end
