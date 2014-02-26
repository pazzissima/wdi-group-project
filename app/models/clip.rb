class Clip < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :tags
  has_many :clip_playlists
  has_many :playlists, through: :clip_playlists
  has_many :likes
  belongs_to :snippable, :polymorphic => true
  has_many :clips, :as => :snippable
  accepts_nested_attributes_for :comments, :playlists

  has_attached_file :mp3, {
    :storage => :s3,
    :s3_credentials => {
    :bucket => ENV['S3_BUCKET_NAME'],
    :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
    :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
  },
    :s3_host_name => 's3-us-west-2.amazonaws.com',
    :url => "/system/:hash.:extension",
    :hash_secret => ENV['IMG_KEY']
}
  validates_attachment_size :mp3, :less_than => 4.megabytes
  validates_attachment_content_type :mp3, :content_type => [ 'application/mp3','application/x-mp3', 'audio/mpeg', 'audio/mp3' ],
            :message => 'Please select a .mp3 file'

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

  def display_tags
    tags = []
    self.tags.each do |t|
      tags << t.text
    end
    tags.join(", ")
  end
end
