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
end
