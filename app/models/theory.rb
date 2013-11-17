# == Schema Information
#
# Table name: theories
#
#  id          :integer          not null, primary key
#  topic_id    :integer
#  name        :string(255)
#  theory_text :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Theory < ActiveRecord::Base
	belongs_to :topic
	validates :topic_id, presence: true
	validates :name, presence: true
	default_scope order: 'theories.topic_id'
end
