
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :clips
  has_many :comments
  has_many :playlists
  has_many :likes

  has_attached_file :avatar, {
    :styles => {
      :thumb => ["50x50#", :png],
      :medium => ["100x100#", :png],
      :large => ["300x300>", :png]
    },
    :convert_options => {
      :thumb => "-gravity Center -crop 50x50+0+0",
      :thumb => "-gravity Center -crop 100x100+0+0",
    },
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

   # Validate content type
  validates_attachment_content_type :avatar, :content_type => /\Aimage/
  # Validate filename
  validates_attachment_file_name :avatar, :matches => [/png\Z/, /jpe?g\Z/]


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable #, :confirmable

end




