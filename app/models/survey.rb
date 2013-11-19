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
  has_many :questions
  accepts_nested_attributes_for :questions, allow_destroy: true

end