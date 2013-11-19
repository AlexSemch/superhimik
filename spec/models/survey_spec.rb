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

require 'spec_helper'

describe Survey do
  pending "add some examples to (or delete) #{__FILE__}"
end
