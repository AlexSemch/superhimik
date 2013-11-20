# == Schema Information
#
# Table name: answers
#
#  id             :integer          not null, primary key
#  question_id    :integer
#  content        :string(255)
#  correct_answer :boolean
#  created_at     :datetime
#  updated_at     :datetime
#

class Answer < ActiveRecord::Base
  belongs_to :question
  validates :question_id, :content, :presence => true
end
