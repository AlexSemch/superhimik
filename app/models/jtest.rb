# == Schema Information
#
# Table name: jtests
#
#  id         :integer          not null, primary key
#  survey_id  :integer
#  user_id    :integer
#  score      :float
#  created_at :datetime
#  updated_at :datetime
#  nav_year   :string(255)
#

class Jtest < ActiveRecord::Base
  belongs_to :survey
  validates :survey_id, presence: true
end
