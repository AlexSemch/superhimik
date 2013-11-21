module TopicsHelper
	
	# Get topic for current user
	def get_topics
		if current_user.admin
			Topic.all
		elsif current_user.grade
			Topic.where(grade: current_user.grade)
		else
			Topic.none
		end
	end

	# Get topic_ids for use in query
	def topic_ids
		topic_ids = []
		get_topics.each do |topic| 
      		topic_ids << topic.id 
    	end
    	return topic_ids
	end
end
