# == Schema Information
#
# Table name: questions
#
#  id               :integer          not null, primary key
#  survey_id        :integer
#  content          :text
#  number_of_answer :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :answers
  accepts_nested_attributes_for :answers, allow_destroy: true
end
