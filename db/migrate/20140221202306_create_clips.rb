class CreateClips < ActiveRecord::Migration
  def change
    create_table :clips do |t|
      t.string :title
      t.references :user, index: true
      t.text :transcript
      t.string :audio
      t.text :description
      t.boolean :private

      t.timestamps
    end
  end
end
