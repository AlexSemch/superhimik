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

require 'spec_helper'

describe Answer do
  pending "add some examples to (or delete) #{__FILE__}"
end
