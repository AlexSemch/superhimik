# == Schema Information
#
# Table name: surveys
#
#  id                  :integer          not null, primary key
#  topic_id            :integer
#  name                :string(255)
#  number_of_quesitons :integer
#  time_to_complete    :integer
#  test_type           :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#

class Survey < ActiveRecord::Base

  belongs_to :topic
  has_many :questions, dependent: :destroy
  has_many :jtests, dependent: :destroy
  accepts_nested_attributes_for :questions, allow_destroy: true
  validates_associated :topic
  validates :topic_id, :name, presence: true

  def random_questions
    questions.order('random()').limit(self.number_of_quesitons)
  end

  #def self.grouped_by_topic(topics)
  #  groups = []
  #  topics.each_with_index do |topic, index|
  #    groups << [topic, Survey.where(topic: topic)]
  #  end
  #  return groups
  #end

end
