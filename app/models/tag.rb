# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  clip_id    :integer
#  text       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Tag < ActiveRecord::Base
  belongs_to :clip

  searchable do
    text :text

    integer :clip_id
    # datetime :created_at
    # datetime :updated_at
  end
end
