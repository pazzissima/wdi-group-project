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
#  is_private  :boolean
#  created_at  :datetime
#  updated_at  :datetime
#

class Clip < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :tags
  accepts_nested_attributes_for :comments

  searchable do
    text :title, :transcript, :description

    text :comments do
      comments.map { |comment| comment.body }
    end

    text :tags do
      tags.map { |tag| tag.text }
    end

    integer :user_id
    boolean :is_private
    # datetime :created_at
    # datetime :updated_at

    string :sort_title do
      title.downcase.gsub(/^(an?|the)/, '')
    end
  end
end
