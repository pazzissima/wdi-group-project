# == Schema Information
#
# Table name: clips
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  user_id     :integer
#  transcript  :text
#  audio       :string(255)
#  description :text
#  private     :boolean
#  created_at  :datetime
#  updated_at  :datetime
#

class Clip < ActiveRecord::Base
  belongs_to :user
end
