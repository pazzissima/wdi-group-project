class AddLocationToClip < ActiveRecord::Migration
  def change
  	add_column :clips, :latitude, :float
  	add_column :clips, :longitude, :float
  	add_column :clips, :ip_address, :string
  end
end
