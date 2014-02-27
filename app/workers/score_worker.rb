class ScoreWorker
  include Sidekiq::Worker
  def perform(clip_id)
	  	clips = Clip.all
		 for clip in clips
		  	created_time = clip.created_at
		    hours_since = (Time.now()-created_time)/3600
		    if hours_since < 100
		      likes = clip.likes.count
		      score = (likes**0.8)/((hours_since+2)**1.8)
		    else
		      score = 0
		    end
		    clip.update_column(:score, score)

	    end
  end

end