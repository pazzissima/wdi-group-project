class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.references :clip, index: true
      t.string :text

      t.timestamps
    end
  end
end
