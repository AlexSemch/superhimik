class Topic < ActiveRecord::Base
	validates :grade, presence: true
	validates :content, presence: true, length: { minimum: 5}
	before_save { |topic| topic.content = content.capitalize}
end
