

class Tag < ActiveRecord::Base
  belongs_to :clip

  searchable do
    text :text

    integer :clip_id
    # datetime :created_at
    # datetime :updated_at
  end
end
