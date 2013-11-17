# == Schema Information
#
# Table name: topics
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  grade      :integer
#  created_at :datetime
#  updated_at :datetime
#

class Topic < ActiveRecord::Base
	validates :grade, presence: true
	validates :content, presence: true, length: { minimum: 5}
	before_save { |topic| topic.content = content.capitalize}
	has_many :theories
	default_scope order: 'topics.grade'
end
