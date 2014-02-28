class GeoWorker
  include Sidekiq::Worker
  def perform(clip_id, request_ip)
  	#ip_address = open('http://whatismyip.akamai.com').read
  	cords = Geocoder.coordinates(request_ip)
  	clip = Clip.find(clip_id)
    clip.update_attributes({ip_address: ip_address, latitude: cords[0], longitude: cords[1]})

  end

end