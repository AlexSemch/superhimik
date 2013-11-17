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

require 'spec_helper'

describe Theory do
  pending "add some examples to (or delete) #{__FILE__}"
end
